# fayez-nazzal/homebrew-tap

Homebrew formulae for my command line tools.

## Install

```sh
brew tap fayez-nazzal/tap
brew install fayez-nazzal/tap/browsershot
brew install fayez-nazzal/tap/contrastshot
brew install fayez-nazzal/tap/tmuxscope
brew install fayez-nazzal/tap/termshot-cap
```

## What is here

| Formula | What it does |
|---|---|
| `browsershot` | Captures a web page to a PNG or GIF as reviewable evidence. |
| `contrastshot` | Measures true WCAG contrast over gradients and images by pixel diff. |
| `tmuxscope` | Keeps one tmux session per scope and repairs the ones that drift. |
| `termshot-cap` | Runs a command in a fresh window and captures it to a PNG. |

Each formula installs a prebuilt macOS binary, so Bun is not needed to install.

`browsershot` and `contrastshot` drive a real browser. Chromium is not bundled. Install it once:

```sh
bunx playwright install chromium
```

## Why `termshot-cap`

Homebrew core already owns the formula name `termshot`. This tap uses `termshot-cap` so both can live in the same Homebrew install. The command it puts on your `PATH` is still called `termshot`, so the two conflict and only one can be linked at a time.

## License

Every tool here is MIT.
