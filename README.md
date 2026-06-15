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

## Troubleshooting

### `sandbox-exec … build.rb … exited with 1`

If `brew install` or `brew upgrade` fails with this error and no other output, it is a
[known Homebrew bug](https://github.com/Homebrew/brew/issues/22699) affecting third-party
taps when `HOMEBREW_REQUIRE_TAP_TRUST` is enabled. It was fixed upstream in
[Homebrew/brew#22700](https://github.com/Homebrew/brew/pull/22700).

```sh
# Update Homebrew to pick up the fix:
brew update && brew upgrade daytonaio/cli/daytona

# Or temporarily bypass the trust check:
HOMEBREW_NO_REQUIRE_TAP_TRUST=1 brew upgrade daytonaio/cli/daytona
```
