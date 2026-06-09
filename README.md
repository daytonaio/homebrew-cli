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
