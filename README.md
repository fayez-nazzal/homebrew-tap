# fayez-nazzal/homebrew-tap

Homebrew formulae for my command line tools.

## Install

```sh
brew tap fayez-nazzal/tap
brew install fayez-nazzal/tap/browsershot
brew install fayez-nazzal/tap/contrastshot
brew install fayez-nazzal/tap/tmuxscope
```

## What is here

| Formula | What it does |
|---|---|
| `browsershot` | Captures a web page to a PNG or GIF as reviewable evidence. |
| `contrastshot` | Measures true WCAG contrast over gradients and images by pixel diff. |
| `tmuxscope` | Keeps one tmux session per scope and repairs the ones that drift. |

Each formula installs a prebuilt macOS binary, so Bun is not needed to install.

`browsershot` and `contrastshot` drive a real browser. Chromium is not bundled. Install it once:

```sh
bunx playwright install chromium
```

## License

Every tool here is MIT.
