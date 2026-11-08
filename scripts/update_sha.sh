#!/bin/bash
set -euo pipefail

# Ensure a version argument is provided
if [ -z "${1:-}" ]; then
  echo "Please provide a version number as an argument."
  exit 1
fi

version="${1}"

# Target formula file is chosen by the caller (stable vs prerelease workflow),
# not guessed from the version string.
ruby_file="${2:-daytona.rb}"

# Strip leading 'v' for the formula version field; keep the original for download URLs
version_bare="${version#v}"

# Release asset name prefix: daytona@0 installs the 0.x CLI, which ships as
# daytona-v0-<os>-<arch> so it can sit next to the daytona binary.
asset_prefix="daytona"

# Safety net: each formula is one channel. Stable takes only bare versions,
# the -rc formula only -rc.N, the -alpha formula only -alpha.N, daytona@0 only
# bare 0.X.Y — so a channel can never be moved by a dispatch meant for another.
case "$ruby_file" in
  daytona.rb)
    if ! [[ "$version_bare" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
      echo "::error::daytona.rb takes only bare X.Y.Z versions, got '$version'. Prereleases go to daytona-rc.rb or daytona-alpha.rb." >&2
      exit 1
    fi ;;
  daytona-rc.rb)
    if ! [[ "$version_bare" =~ ^[0-9]+\.[0-9]+\.[0-9]+-rc\.[0-9]+$ ]]; then
      echo "::error::daytona-rc.rb takes only X.Y.Z-rc.N versions, got '$version'." >&2
      exit 1
    fi ;;
  daytona-alpha.rb)
    if ! [[ "$version_bare" =~ ^[0-9]+\.[0-9]+\.[0-9]+-alpha\.[0-9]+$ ]]; then
      echo "::error::daytona-alpha.rb takes only X.Y.Z-alpha.N versions, got '$version'." >&2
      exit 1
    fi ;;
  daytona@0.rb)
    if ! [[ "$version_bare" =~ ^0\.[0-9]+\.[0-9]+$ ]]; then
      echo "::error::daytona@0.rb takes only bare 0.X.Y versions, got '$version'." >&2
      exit 1
    fi
    asset_prefix="daytona-v0" ;;
esac

echo "Updating ${ruby_file} -> ${version_bare}"

# Detect operating system
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS: Use gsed
  sed_cmd="gsed"
else
  # Linux or other systems: Use sed
  sed_cmd="sed"
fi

# Download files for different architectures
architectures=(
  "darwin-arm64"
  "darwin-amd64"
  "linux-amd64"
  "linux-arm64"
)

urls=(
  "https://github.com/daytona/clients/releases/download/v${version_bare}/${asset_prefix}-darwin-arm64"
  "https://github.com/daytona/clients/releases/download/v${version_bare}/${asset_prefix}-darwin-amd64"
  "https://github.com/daytona/clients/releases/download/v${version_bare}/${asset_prefix}-linux-amd64"
  "https://github.com/daytona/clients/releases/download/v${version_bare}/${asset_prefix}-linux-arm64"
)

$sed_cmd -i.bak -E "0,/version \".*\"/s/version \".*\"/version \"${version_bare}\"/" "$ruby_file"

# Download and calculate SHA256 for each file and update SHA256 values
for ((i = 0; i < ${#architectures[@]}; i++)); do
  file_name="${asset_prefix}-${architectures[$i]}"
  if ! curl -fSL -o "$file_name" "${urls[$i]}"; then
    echo "::error::Failed to download ${urls[$i]} (HTTP error). Aborting." >&2
    exit 1
  fi
  sha256=$(shasum -a 256 "$file_name" | awk '{print $1}')
  if ! [[ "$sha256" =~ ^[0-9a-f]{64}$ ]]; then
    echo "::error::Invalid SHA256 for $file_name: '$sha256'" >&2
    exit 1
  fi
  echo "${architectures[$i]}: ${sha256}"
  # Every formula downloads from daytona/clients (older daytona-rc versions
  # pointed at another repository): rewrite the URL along with its checksum.
  $sed_cmd -i.bak -E "s#url \"https://github.com/[^/\"]+/[^/\"]+/releases/download/(v\#\{version\}/${file_name})\"#url \"https://github.com/daytona/clients/releases/download/\1\"#" "$ruby_file"
  $sed_cmd -i.bak -E "/url .*$file_name/{n; s/(sha256 \")(.*)(\")/\1${sha256}\3/}" "$ruby_file"

  # Verify the formula now contains the expected URL and SHA for this asset.
  if ! grep -qF "url \"https://github.com/daytona/clients/releases/download/v#{version}/${file_name}\"" "$ruby_file"; then
    echo "::error::Formula ${ruby_file} does not contain a URL for ${file_name} after update. Aborting." >&2
    exit 1
  fi
  if ! grep -q "sha256 \"${sha256}\"" "$ruby_file"; then
    echo "::error::Formula ${ruby_file} does not contain sha256 ${sha256} for ${file_name} after update. Aborting." >&2
    exit 1
  fi

  rm "$file_name"
done

# Clean up sed backup files
rm -f "${ruby_file}.bak"

echo "Updated ${ruby_file}: version ${version_bare} (tag ${version})"
