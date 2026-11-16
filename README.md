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

## Channels

| Formula | Line | Installs as |
|---|---|---|
| `daytona` | stable releases: the 0.x CLI until Daytona CLI 2.0.0 is released, the 2.x CLI from then on | `daytona` |
| `daytona-rc` | 2.x release candidates (`2.Y.Z-rc.N`), from the first 2.x rc on | `daytona` |
| `daytona-alpha` | 2.x alpha releases (`2.Y.Z-alpha.N`) | `daytona` |
| `daytona-v0@0` | the 0.x CLI, stable `0.X.Y` releases | `daytona-v0` |

```sh
brew install daytonaio/cli/daytona-alpha   # the 2.x CLI before 2.0.0
```

`daytona`, `daytona-rc` and `daytona-alpha` install the same `daytona`
binary, so they conflict: install one of them. Each formula only ever accepts
its own version shape (`scripts/update_sha.sh`), so a release dispatch for
one channel never moves another. A formula also only moves forward: a
dispatch of a version below the one the formula names fails the tap run and
leaves the formula as it is.

`daytona-v0@0` installs the 0.x CLI as `daytona-v0`, so it installs side by
side with any of the above:

```sh
brew install daytonaio/cli/daytona-v0@0
daytona-v0 version
```

The formula is deliberately not named `daytona@0`. For an `@`-versioned
formula Homebrew also loads the formula named before the `@`, looked up by
short name in every tap. As `daytona@0` that was `daytona`, which a fully
qualified install does not trust (tap trust, Homebrew 6.0+), and which the
legacy `daytona/tap` also provides ("Formulae found in multiple taps").
`daytona-v0@0` has no `daytona-v0` formula to load, so neither happens.
`formula_renames.json` maps `daytona@0` to `daytona-v0@0`, which moves
existing installs over (`brew migrate daytona@0`).

## Alternative installation (without Homebrew)

Install the Daytona CLI with its installer, which verifies the release checksum (macOS and Linux; see the [CLI README](https://github.com/daytona/clients/tree/main/cli#install) for Windows and channels):

```sh
curl -fsSL https://raw.githubusercontent.com/daytona/clients/main/cli/install.sh | sh
```

It installs the 2.x CLI (before 2.0.0, its newest pre-release). The 0.x CLI
ships `install-v0.sh` with each 0.x release of
[daytona/clients](https://github.com/daytona/clients/releases).
