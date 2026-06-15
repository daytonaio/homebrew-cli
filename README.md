# Daytona CLI Homebrew Formula

```sh
# Install
brew install daytonaio/cli/daytona

# Trust the tap once so routine `brew upgrade` keeps Daytona up to date
brew trust daytonaio/cli

# Upgrade
brew upgrade daytonaio/cli/daytona
```

Recent Homebrew versions require third-party taps to be explicitly trusted. Without the one-time `brew trust daytonaio/cli`, a routine `brew upgrade` silently skips this tap and the Daytona CLI goes stale.

## Alternative installation (without Homebrew)

Install the latest Daytona CLI directly from GitHub releases (works on both macOS and Linux, auto-detects architecture):

```sh
sudo curl -fsSL "https://github.com/daytonaio/daytona/releases/latest/download/daytona-$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m | sed -e 's/x86_64/amd64/' -e 's/aarch64/arm64/')" -o /usr/local/bin/daytona && sudo chmod +x /usr/local/bin/daytona
```
