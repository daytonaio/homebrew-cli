#!/bin/bash
set -e

# Ensure a version argument is provided
if [ -z "$1" ]; then
  echo "Please provide a version number as an argument."
  exit 1
fi

version="${1}"
ruby_file="daytona.rb"

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
  "https://github.com/daytonaio/daytona/releases/download/${version}/daytona-darwin-arm64"
  "https://github.com/daytonaio/daytona/releases/download/${version}/daytona-darwin-amd64"
  "https://github.com/daytonaio/daytona/releases/download/${version}/daytona-linux-amd64"
  "https://github.com/daytonaio/daytona/releases/download/${version}/daytona-linux-arm64"
)

$sed_cmd -i.bak -E "0,/version \".*\"/s/version \".*\"/version \"${version}\"/" "$ruby_file"

# Download and calculate SHA256 for each file and update SHA256 values
for ((i = 0; i < ${#architectures[@]}; i++)); do
  file_name="daytona-${architectures[$i]}"
  curl -sL -o "$file_name" "${urls[$i]}"
  sha256=$(shasum -a 256 "$file_name" | awk '{print $1}')
  echo "$sha256"
  $sed_cmd -i.bak -E "/url .*$file_name/{n; s/(sha256 \")(.*)(\")/\1${sha256}\3/}" "$ruby_file"
  rm "$file_name"
done

echo "Updated file with version ${version} and new SHA256 values"