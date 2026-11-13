# android12-fastfetch

[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
![Fastfetch](https://img.shields.io/badge/fastfetch-config-5e5ce6)
![Android 12](https://img.shields.io/badge/Android-12-3DDC84?logo=android&logoColor=white)
![Config version](https://img.shields.io/badge/config%20version-v1.1.0-blue)
![Termux](https://img.shields.io/badge/Termux-ready-000000?logo=termux)

A [Fastfetch](https://github.com/fastfetch-cli/fastfetch) config tuned for **Android 12 / Termux** and native **X11 Termux desktops** (XFCE, MATE, LXQt, …). It draws a fixed-width table with hardware, desktop, terminal, development, and uptime sections, then prints the color palette.

<p align="center"><i>Actual <code>fastfetch -c config.jsonc --pipe</code> output from this repo's author's Android 12 Termux device (fastfetch 2.71.0) — fixed-width bordered table, hardware → desktop → terminal → development → uptime, with the Gruvbox palette printed at the bottom. Shown with the ANSI cursor escapes stripped (as <code>--pipe</code> piped through <code>sed</code> emits it), so the logo column and the table collapse slightly — in a real terminal the cursor positioning lines the right border up exactly.</i></p>

```text
                    zzzzzzzzzzzzzzzzzzzz                        ╔═══════════════╦═══════════════════════════════════════════════╗ fastfetch - 2.71.0 
                zzzzzzzzzzzzzzzzzzzzzzzzzzzz                    ║    Linux║║Android Snow Cone 12 aarch64
             zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz                 ║    Fetched   ║║2026-11-13 21:33:48 PST
          zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz              ║    Locale    ║║en_US.UTF-8
        zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz            ║┌──────────────┬──────────────────────────────────────────────┐║ Hardware 
       zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz           ║│   RAM       ││║3.18 GiB / 3.72 GiB (85%)
     zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz         ║│ 󰓡  SWAP      ││║1.41 GiB / 2.05 GiB (69%)
    zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz        ║│   CPU       ││║MT6762 (4+4) @ 2.00 GHz
   zzzzzzzzzzz{›—{zzzzzzzzzzzzzí{——››—{ízzzzzzzzzzzzzzzzz       ║│   Processes││║28 (117 threads)
  zzzzzzzzzzzzíí{› {zzzzzzzzí—  —{{íí{—› —ízzzzzzzzzzzzzzz      ║│ 󰾲  GPU       ││║PowerVR Rogue GE8320 [Integrated]
 zzzzzzzzzzzzzzzzz— {zzzzzz— ›{zzzzzzzzzí› —zzzzzzzzzzzzzzz     ║│   Disk      ││║31.86 GiB / 50.44 GiB (63%) - ext4
 zzzzzzzzzzzzzzzzzz ›zzzzz› {zzzzzzzzzzzzz— —zzzzzzzzzzzzzz     ║│   Battery   ││║38% (4 hours, 26 mins remaining) [Discharging]
zzzzzzzzzzzzzzzzzzz ›zzzz{ —zzzzzzzzzzzzzzz› ízzzzzzzzzzzzzz    ║└──────────────┴──────────────────────────────────────────────┘║
zzzzzzzzzzzzzzzzzzz ›zzzz{{zzzzzzzzzzzzzzzz{ —zzzzzzzzzzzzzz    ║┌──────────────┬──────────────────────────────────────────────┐║ Desktop 
zzzzzzzzzzzzzzzzzzz ›zzzzzzzzzzzzzzzzzzzzzz{ —zzzzzzzzzzzzzz    ║│ 󰩟  Local IP ││║192.168.18.197/24 *
zzzzzzzzzzzzzzzzzzz ›zzzzzzzzzzzzzzzzzzzzí{ —zzzzzzzzzzzzzzz    ║│   Session   ││║WindowManager (SurfaceFlinger)
zzzzzzzzzzzzzzzzzzz ›zzzzzzzzzí{—››       —{zzzzzzzzzzzzzzzz    ║│ 󰍹  Display   ││║1280x800 @ 60 Hz
zzzzzzzzzzzzzzzzzzz ›zzzzzzz{››—íízzzzzzzzzzzzzzzzzzzzzzzzzz    ║│ 󰍹  X11 Back  ││║Unknown
zzzzzzzzzzzzzzzzzzz ›zzzzzz› ízzzzzzzzzzzzzzzzzzzzzzzzzzzzzz    ║│ 󰾲  G-Driver  ││║
zzzzzzzzzzzzzzzzzzz ›zzzzz ›ízzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz    ║│ 󰉼  Themes    ││║Lavanda-Sea-Light [GTK2]
zzzzzzzzzzzzzzzzzzz ›zzzz{ {zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz    ║│   Icons     ││║Reversal-blue [GTK2]
 zzzzzzzzzzzzzzzzzz ›zzzz› ízzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz     ║└──────────────┴──────────────────────────────────────────────┘║
 zzzzzzzzzzzzzzzzzz ›zzzz› zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz     ║┌──────────────┬──────────────────────────────────────────────┐║ Terminal 
  zzzzzzzzzzzzzzzzz ›zzzz› íííííííííííííííííízzzzzzzzzzzzz      ║│   Shell     ││║zsh 5.9.2
   zzzzzzzzzzzzzzzz›—zzzz—›››››››››››››››››››{zzzzzzzzzzz       ║│   Terminal  ││║opencode
    zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz        ║│ 󰏖  Packages  ││║493 (dpkg)
     zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz         ║│ 󰏖  Pkg Mgr   ││║pkg (Termux)
       zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz           ║└──────────────┴──────────────────────────────────────────────┘║
        zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz            ║┌──────────────┬──────────────────────────────────────────────┐║ Development 
          zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz              ║│   Rust      ││║rustc not installed
             zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz                 ║│   Clang     ││║clang 21.1.8
                zzzzzzzzzzzzzzzzzzzzzzzzzzzz                    ║│   NodeJS    ││║node 26.13.0
                    zzzzzzzzzzzzzzzzzzzz                        ║│   Go        ││║go not installed
 _____________________                                          ║│   Zig       ││║zig not installed
< Noot noot Penguins! >                                         ║│ 󱞎  Editor    ││║nano 9.3
 ---------------------                                          ║│ 󰊢  Git       ││║git 2.56.1
   \                                                            ║│   Interface ││║Sans (11pt) [GTK2]
    \                                                           ║└──────────────┴──────────────────────────────────────────────┘║
        .--.                                                    ║┌──────────────┬──────────────────────────────────────────────┐║ Uptime 
       |o_o |                                                   ║│   Uptime    ││║3 hours, 42 mins
       |:_/ |                                                   ║└──────────────┴──────────────────────────────────────────────┘║
      //   \ \                                                  ╚═══════════════════════════════════════════════════════════════╝
     (|     | )                                                 
    /'\_   _/`\                                                                         
    \___)=(___/
```

## What's included

- `config.jsonc` — the Fastfetch config (JSONC, comments allowed)
- `ascii.txt` — the penguin ASCII logo referenced by the config

## Requirements

- [fastfetch](https://github.com/fastfetch-cli/fastfetch) — **2.51.0 or newer** (JSONC config format); tested on 2.71.0
- A terminal with UTF-8, a Nerd Font, and truecolor for the icons and borders
- On Termux: `pkg install fastfetch` (or build from source)
- Optional, for the Desktop section: `xdpyinfo` and `xrandr` (missing commands show `Unknown` instead of failing)

> **Before 2.51.0?** The JSONC config format was not stable yet — upgrade with
> `pkg update && pkg upgrade fastfetch`, or fetch a release build from the
> fastfetch GitHub releases.

## Install

```bash
git clone https://github.com/Mark44928/android12-fastfetch.git
cd android12-fastfetch

mkdir -p ~/.config/fastfetch
cp config.jsonc ~/.config/fastfetch/config.jsonc
cp ascii.txt ~/ascii.txt

fastfetch
```

Fastfetch reads `~/.config/fastfetch/config.jsonc` by default. The config points the logo at `~/ascii.txt`, so keep that path or edit `logo.source`.

### One-liner

```bash
mkdir -p ~/.config/fastfetch
curl -fsSL https://raw.githubusercontent.com/Mark44928/android12-fastfetch/main/config.jsonc -o ~/.config/fastfetch/config.jsonc
curl -fsSL https://raw.githubusercontent.com/Mark44928/android12-fastfetch/main/ascii.txt -o ~/ascii.txt
fastfetch
```

## Customize

- **Logo** — edit `logo.source` in `config.jsonc`. Set `"type": "builtin"` to use Fastfetch's built-in logos instead. `ascii.txt` is a penguin-style ASCII logo kept in `$HOME` (see its provenance note in [Notes](#notes-and-troubleshooting)).
- **Disk folders** — edit `"folders"` to match your storage. The default is `/data:/storage/emulated/0` (internal storage, works on every device); run `ls /storage` to discover an SD-card mount point like `/storage/0143-1A2B` and add it, colon-separated.
- **Colors** — the config uses Gruvbox hex values. Change the `{##...}` colors to match your theme.
- **Sections** — remove or comment out modules you do not need (for example `battery`, `gpu`, `localip`, or `wm`).
- **Key width** — the cursor constants (`\u001b[47D`, `\u001b[47C`, …) assume a 47-column value block. If you change the labels or width, adjust those constants too.

## Notes and troubleshooting

- The config is **JSONC**: comments are allowed. Fastfetch accepts it, but strict JSON tools may not.
- `$schema` is pinned to the **2.71.0 release tag** — bump it (and re-run `fastfetch`) when you upgrade fastfetch, so schema drift cannot silently invalidate the config.
- In a plain Termux shell the Desktop-section rows (Session, Display, WM Theme, Icons, Terminal Font, Terminal Theme, X11 Backend) print `Unknown` — they are only meaningful under Termux:X11. Delete that section if you never use X11; the command modules inside it already gate themselves with `system` conditionals.
- The two GPU rows are intentional: **GPU** is the hardware model, **G-Driver** is the driver/version detail.
- The **Hardware** section (`RAM`, `CPU`, …) also renders correctly in plain Termux — only the *desktop* rows need X11.
- `xdpyinfo` comes from `x11-utils` on Debian/Ubuntu or the Termux X11 packages.
- Long values (CPU model, Terminal Font, Theme strings) can push past the 47-column value block and shift the right border — shorten the terminal font/theme values, or wrap them in a per-module `format` if your device shows misaligned rows.
- **`ascii.txt` provenance:** the penguin-style logo was assembled by the repo author from ASCII penguin art in the style of the classic `pingu`/`cowsay` lineage; it is a configuration asset covered by the repo's MIT license, not a stock fastfetch logo.
- The Disk row in the preview assumes the default `/data:/storage/emulated/0` mount points; your `disk` module will print differently if you add a custom `folders` entry.

## Changelog

### Config v1.1.0
- **`Processes` row** in the Hardware section (process + thread count) — the
  label keeps the fixed-width alignment, and the module works on plain Termux
  CLI, not just X11
- `$schema` pinned to the **2.71.0 release tag** instead of the moving `dev`
  branch, so schema drift cannot silently invalidate the config
- `disk.folders` defaults to `/data:/storage/emulated/0` (works on every
  device) instead of the author's SD-card UUID, with a comment explaining how
  to add your own mount point
- Desktop section documented as X11-only, and the two GPU rows
  (hardware model vs driver version) explained
- `ascii.txt` provenance/language added to the license note
- CI actually runs `fastfetch -c config.jsonc --pipe` on a real 2.71.0 binary
  and asserts the RAM/CPU/Disk rows render


## 🛠️ More from Mark44928

Tiny, dependency-free tools from the same family:

- [plusafetch](https://github.com/Mark44928/plusafetch) — C++23 fetch for Termux — ~23 ms, zero subprocesses on the default path
- [Plusalator](https://github.com/Mark44928/Plusalator) — C++17 calculator REPL — Qalculate-flavored, ghost autosuggest, 18 themes
- [GrubBlastersHTML](https://github.com/Mark44928/GrubBlastersHTML) — Worms-style artillery in one HTML file — 70 weapons, fully destructible terrain
- [SnakTUI](https://github.com/Mark44928/SnakTUI) — modern Snake for your terminal — Textual + Python
- [Easy-Termux-Package-Manager](https://github.com/Mark44928/Easy-Termux-Package-Manager) — fzf-driven package manager for Termux — snapshots, audit, 183 tests
- [NoNameOS](https://github.com/Mark44928/NoNameOS) — OS simulation in a single C++17 file — virtual FS, real shell
- [Greenit](https://github.com/Mark44928/Greenit) — green-injected theme family — dark + light, single palette.json
- [CalculaHTML](https://github.com/Mark44928/CalculaHTML) — static HTML calculator — 15 themes + System mode, zero deps
- [Anti-bloatware-list-for-Android-TV-Boxes-and-Sticks-for-rooted](https://github.com/Mark44928/Anti-bloatware-list-for-Android-TV-Boxes-and-Sticks-for-rooted) — ADB debloat for rooted Android 9+ TV sticks & boxes
- [Android9-audios](https://github.com/Mark44928/Android9-audios) — 217 stock Android 9 system sounds + per-file SHA-256

## License

[MIT](LICENSE) — free to reuse, fork, or adapt. See [CONTRIBUTING.md](CONTRIBUTING.md)
to contribute; this project follows the standard [Code of Conduct](CODE_OF_CONDUCT.md).
