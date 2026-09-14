#!/bin/bash
set -e

# Ensure a version argument is provided
if [ -z "$1" ]; then
  echo "Please provide a version number as an argument."
  exit 1
fi

version="${1}"

# Target formula file is chosen by the caller (stable vs prerelease workflow),
# not guessed from the version string.
ruby_file="${2:-daytona.rb}"

# Strip leading 'v' for the formula version field; keep the original for download URLs
version_bare="${version#v}"

# Safety net: each formula is one channel. Stable takes only bare versions,
# the -rc formula only -rc.N, the -alpha formula only -alpha.N — so a channel
# can never be moved by a dispatch meant for another.
case "$ruby_file" in
  daytona.rb)
    if [[ "$version_bare" =~ [-a-zA-Z] ]]; then
      echo "::error::Refusing to update stable formula daytona.rb with prerelease version '$version'. Use daytona-rc.rb or daytona-alpha.rb." >&2
      exit 1
    fi ;;
  daytona-rc.rb)
    if ! [[ "$version_bare" =~ -rc\.[0-9]+$ ]]; then
      echo "::error::daytona-rc.rb takes only X.Y.Z-rc.N versions, got '$version'." >&2
      exit 1
    fi ;;
  daytona-alpha.rb)
    if ! [[ "$version_bare" =~ -alpha\.[0-9]+$ ]]; then
      echo "::error::daytona-alpha.rb takes only X.Y.Z-alpha.N versions, got '$version'." >&2
      exit 1
    fi ;;
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
  "https://github.com/daytona/clients/releases/download/${version}/daytona-darwin-arm64"
  "https://github.com/daytona/clients/releases/download/${version}/daytona-darwin-amd64"
  "https://github.com/daytona/clients/releases/download/${version}/daytona-linux-amd64"
  "https://github.com/daytona/clients/releases/download/${version}/daytona-linux-arm64"
)

$sed_cmd -i.bak -E "0,/version \".*\"/s/version \".*\"/version \"${version_bare}\"/" "$ruby_file"

# Download and calculate SHA256 for each file and update SHA256 values
for ((i = 0; i < ${#architectures[@]}; i++)); do
  file_name="daytona-${architectures[$i]}"
  if ! curl -fSL -o "$file_name" "${urls[$i]}"; then
    echo "::error::Failed to download ${urls[$i]} (HTTP error). Aborting." >&2
    exit 1
  fi
  sha256=$(shasum -a 256 "$file_name" | awk '{print $1}')
  echo "${architectures[$i]}: ${sha256}"
  $sed_cmd -i.bak -E "/url .*$file_name/{n; s/(sha256 \")(.*)(\")/\1${sha256}\3/}" "$ruby_file"
  rm "$file_name"
done

# Clean up sed backup files
rm -f "${ruby_file}.bak"

echo "Updated ${ruby_file}: version ${version_bare} (tag ${version})"
