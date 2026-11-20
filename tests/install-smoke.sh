#!/data/data/com.termux/files/usr/bin/env bash
# Installer CI: fake HOME/XDG -> install -> uninstall.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP="${TMPDIR:-$HOME/.cache}/ff-install-smoke.$$"
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP/home" "$TMP/config" "$TMP/state"
export HOME="$TMP/home" XDG_CONFIG_HOME="$TMP/config" XDG_STATE_HOME="$TMP/state"
bash "$ROOT/install.sh" --yes >/dev/null
test -f "$XDG_CONFIG_HOME/fastfetch/config.jsonc"
test -f "$HOME/ascii.txt"
bash "$ROOT/install.sh" --yes >/dev/null
bash "$ROOT/install.sh" --uninstall --yes >/dev/null
test ! -e "$XDG_CONFIG_HOME/fastfetch/config.jsonc"
test ! -e "$HOME/ascii.txt"
mkdir -p "$XDG_CONFIG_HOME/fastfetch"
cp "$ROOT/config.jsonc" "$XDG_CONFIG_HOME/fastfetch/config.jsonc"
bash "$ROOT/install.sh" --yes >/dev/null
bash "$ROOT/install.sh" --uninstall --yes >/dev/null
test -f "$XDG_CONFIG_HOME/fastfetch/config.jsonc"
rm -f "$XDG_CONFIG_HOME/fastfetch/config.jsonc"
bash "$ROOT/install.sh" --snaktui --yes >/dev/null
cmp "$ROOT/presets/snaktui.jsonc" "$XDG_CONFIG_HOME/fastfetch/config.jsonc"
bash "$ROOT/install.sh" --uninstall --yes >/dev/null
test ! -e "$XDG_CONFIG_HOME/fastfetch/config.jsonc"
bash "$ROOT/install.sh" --preset greenit --yes >/dev/null
cmp "$ROOT/presets/greenit.jsonc" "$XDG_CONFIG_HOME/fastfetch/config.jsonc"
bash "$ROOT/install.sh" --uninstall --yes >/dev/null
if bash "$ROOT/install.sh" --preset nope --yes >/dev/null 2>&1; then
    echo "unknown preset was accepted" >&2
    exit 1
fi
echo "installer smoke OK"
