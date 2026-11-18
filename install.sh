#!/data/data/com.termux/files/usr/bin/env bash
# Install/uninstall the android12-fastfetch config with backups and a manifest.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/fastfetch"
SOURCE="$REPO_DIR/config.jsonc"
SOURCE_SET=0
DRY=0
YES=0
UNINSTALL=0
FORCE=0
KEEP_LOGO=0
MENU=1
STATE_DIR="${XDG_STATE_HOME:-$HOME/.local/state}/android12-fastfetch"
MANIFEST="$STATE_DIR/installed.tsv"

usage() {
    cat <<EOF
Usage: ./install.sh [options]

Install:
  --minimal      install presets/minimal.jsonc instead of the full dashboard
  --snaktui      install presets/snaktui.jsonc instead of the full dashboard
  --dry-run      print what would change
  --yes          skip menus and the confirmation
  --no-menu      never show the interactive fzf menu

Uninstall:
  --uninstall    remove the config and logo recorded by this installer
  --keep-logo    keep ~/ascii.txt when uninstalling
  --force        remove recorded files even if edited since install

  -h, --help     show this help
EOF
}

die() { printf 'error: %s\n' "$*" >&2; exit 1; }
info() { printf '\033[38;2;142;192;124m[fastfetch]\033[0m %s\n' "$*"; }
warn() { printf '\033[38;2;230;170;70m[fastfetch]\033[0m %s\n' "$*" >&2; }
have() { command -v "$1" >/dev/null 2>&1; }

while [ "$#" -gt 0 ]; do
    case "$1" in
        --minimal) SOURCE_SET=1; SOURCE="$REPO_DIR/presets/minimal.jsonc" ;;
        --snaktui) SOURCE_SET=1; SOURCE="$REPO_DIR/presets/snaktui.jsonc" ;;
        --dry-run) DRY=1 ;;
        --yes|-y) YES=1; MENU=0 ;;
        --no-menu) MENU=0 ;;
        --uninstall) UNINSTALL=1 ;;
        --keep-logo) KEEP_LOGO=1 ;;
        --force) FORCE=1 ;;
        -h|--help) usage; exit 0 ;;
        *) die "unknown option: $1 (try --help)" ;;
    esac
    shift
done

hash_file() {
    if have sha256sum; then sha256sum "$1" | cut -d' ' -f1
    elif have shasum; then shasum -a 256 "$1" | cut -d' ' -f1
    elif have cksum; then cksum "$1" | awk '{print $1 "-" $2}'
    else printf 'unknown'
    fi
}

manifest_upsert() {
    local path="$1" tmp
    mkdir -p "$STATE_DIR"
    tmp="$MANIFEST.$$"
    { [ -f "$MANIFEST" ] && awk -F'\t' -v p="$path" '$1 != p' "$MANIFEST" || true; } > "$tmp"
    printf '%s\t%s\n' "$path" "$(hash_file "$path")" >> "$tmp"
    mv -f "$tmp" "$MANIFEST"
}

install_file() { # <source> <destination>
    local src="$1" dst="$2" bak tmp
    if [ "$DRY" = "1" ]; then
        printf '  would install %s -> %s\n' "${src#"$REPO_DIR"/}" "$dst"
        return 0
    fi
    mkdir -p "$(dirname "$dst")"
    if [ -f "$dst" ] && cmp -s "$src" "$dst"; then
        printf '  unchanged: %s\n' "$dst"
        manifest_upsert "$dst"
        return 0
    fi
    if [ -e "$dst" ] || [ -L "$dst" ]; then
        bak="$dst.bak-$(date +%Y%m%d-%H%M%S)-$$"
        if [ -L "$dst" ]; then
            # Keep the symlink itself as the backup instead of writing
            # through it into whatever it points at.
            mv "$dst" "$bak"
        else
            cp -p "$dst" "$bak"
        fi
        printf '  backup: %s\n' "$bak"
    fi
    tmp="$(mktemp "$dst.tmp.XXXXXX")" || die "failed to create temp in $(dirname "$dst")"
    if ! cp -p "$src" "$tmp"; then rm -f "$tmp"; die "failed to write $tmp"; fi
    mv -f "$tmp" "$dst"
    manifest_upsert "$dst"
    printf '  installed: %s\n' "$dst"
}

if [ "$UNINSTALL" = "1" ]; then
    [ -f "$MANIFEST" ] || { info "no files recorded by this installer"; exit 0; }
    if [ "$YES" = "0" ] && [ "$DRY" = "0" ]; then
        if [ -t 0 ]; then
            printf 'Remove files recorded in %s? [y/N] ' "$MANIFEST"
            read -r reply
            case "$reply" in [Yy]*) ;; *) echo "Canceled."; exit 0 ;; esac
        else
            die "use --yes with --uninstall in a non-interactive shell"
        fi
    fi
    removed=0; kept=0; tmp="$MANIFEST.$$"; tmp_old="$tmp.old"
    cat "$MANIFEST" > "$tmp_old"
    while IFS=$'\t' read -r path old_hash; do
        [ -n "$path" ] || continue
        if [ "$KEEP_LOGO" = "1" ] && [ "$path" = "$HOME/ascii.txt" ]; then
            printf '%s\t%s\n' "$path" "$old_hash" >> "$tmp"
            kept=$((kept + 1)); continue
        fi
        [ -e "$path" ] || [ -L "$path" ] || continue
        if [ "$FORCE" = "0" ] && [ "$(hash_file "$path")" != "$old_hash" ]; then
            warn "keeping modified file: $path (use --force to remove)"
            printf '%s\t%s\n' "$path" "$old_hash" >> "$tmp"
            kept=$((kept + 1)); continue
        fi
        if [ "$DRY" = "1" ]; then
            printf '  would remove: %s\n' "$path"
        else
            rm -f "$path"
            printf '  removed: %s\n' "$path"
        fi
        removed=$((removed + 1))
    done < "$tmp_old"
    if [ "$DRY" = "0" ]; then
        if [ "$kept" -eq 0 ]; then rm -f "$MANIFEST"; rmdir "$STATE_DIR" 2>/dev/null || true
        else mv -f "$tmp" "$MANIFEST"; fi
    fi
    rm -f "$tmp" "$tmp_old"
    info "uninstall complete: $removed removed, $kept kept"
    exit 0
fi

if [ "$MENU" = "1" ] && [ "$SOURCE_SET" = "0" ] && [ -t 0 ] && [ -t 1 ] && have fzf; then
    choice=$(printf 'Full dashboard\nMinimal preset\nSnakTUI preset\nCancel\n' \
        | fzf --reverse --height=30% --border --prompt='fastfetch config> ') || choice="Cancel"
    case "$choice" in
        "Full dashboard") ;;
        "Minimal preset") SOURCE="$REPO_DIR/presets/minimal.jsonc" ;;
        "SnakTUI preset") SOURCE="$REPO_DIR/presets/snaktui.jsonc" ;;
        *) echo "Canceled."; exit 0 ;;
    esac
fi

[ -f "$SOURCE" ] || die "missing config: $SOURCE"
[ -f "$REPO_DIR/ascii.txt" ] || die "missing logo: ascii.txt"
if ! have fastfetch; then
    warn "fastfetch is not installed; install it first (pkg install fastfetch)"
fi

if [ "$YES" = "0" ] && [ "$DRY" = "0" ] && [ -t 0 ]; then
    printf 'Install %s to %s and ascii.txt to ~/ascii.txt? [Y/n] ' "$(basename "$SOURCE")" "$CONFIG_DIR"
    read -r reply
    case "${reply:-y}" in [Yy]*) ;; *) echo "Canceled."; exit 0 ;; esac
fi

install_file "$SOURCE" "$CONFIG_DIR/config.jsonc"
install_file "$REPO_DIR/ascii.txt" "$HOME/ascii.txt"

if [ "$DRY" = "1" ]; then exit 0; fi
if have fastfetch; then
    if fastfetch -c "$CONFIG_DIR/config.jsonc" --pipe >/dev/null 2>&1; then
        info "validation: fastfetch rendered the config successfully"
    else
        warn "fastfetch could not render the config; check the installed file"
    fi
fi
