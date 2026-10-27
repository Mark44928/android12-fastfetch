# Contributing to android12-fastfetch

Thanks for wanting to improve this config! It is intentionally tiny — one
JSONC config and one ASCII logo — and staying tiny is the point.

## Ground rules

1. **Two files.** Everything lives in `config.jsonc` and `ascii.txt`. Do not
   add shell scripts, build steps, or dependencies.
2. **JSONC comments are allowed** — Fastfetch reads them fine, but keep them
   short and only where they explain *why* a value is what it is.
3. **The 47-column value block is load-bearing.** The cursor constants
   (`\u001b[47D`, `\u001b[47C`, …) and the label widths must agree. If you
   change labels or layout, re-check the alignment in a real terminal.
4. **Screenshot changes**: update the preview PNG only when the rendered
   output changes. Compress it (PNG → ~200 KB or smaller) before committing.

## Getting started

1. Fork and clone the repository.
2. Copy `config.jsonc` to `~/.config/fastfetch/config.jsonc` and `ascii.txt`
   to `~/ascii.txt` (see the README one-liner).
3. Run `fastfetch` — it must not error. Fix any module that needs extended
   JSON schema (check `fastfetch --list-json-keys`).
4. Verify alignment: table edges line up in at least 60- and 100-column
   terminals.

## Sending changes

- One feature or fix per PR. Keep diff small; this repo has ~70 lines total.
- Include a before/after screenshot in the PR description when output changes.
- Commit style: one imperative line (`fix disk folder path`, `add battery
  module guard`).

## Reporting issues

Open an issue with: your `fastfetch --version`, device model, Android
version, and the actual output (plain text, not a photo) plus what you
expected instead.
