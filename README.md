# homebrew-tap

Homebrew formulae for [junior](https://github.com/junior)'s tools.

```bash
brew install junior/tap/skilla
brew install junior/tap/s3tx
```

| Formula | What it is |
|---------|------------|
| [`skilla`](https://github.com/junior/skilla) | Install [agent skills](https://agentskills.io/) from git repos — plain bash, no Node |
| [`s3tx`](https://github.com/junior/s3tx) | Move files in and out of locked-down machines through a private S3 bucket and short-lived presigned URLs; the far end needs only curl |

## Tap trust

Since Homebrew 6, a formula from a tap is loaded only once you trust it. The
one-line install above needs nothing extra: a fully qualified name trusts that
formula by itself.

Two cases need one more command. Installing by short name:

```bash
brew tap junior/tap
brew trust junior/tap          # or: brew trust --formula junior/tap/skilla
brew install skilla
```

And a Brewfile, because `brew bundle` trusts nothing on its own. Run this once
per machine, or the entry is skipped with a warning:

```bash
brew trust --formula junior/tap/skilla
```

Without it Homebrew says "Refusing to load formula junior/tap/skilla from
untrusted tap junior/tap", which reads like a broken formula but is not.
