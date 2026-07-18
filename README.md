# android12-fastfetch
Fastfetch good config for Android 12 and Native X11 Termux desktop (XFCE, MATE, LXQt, etc.....)

![Preview](Screenshot_20260719-000819.png)

for fastfetch config:
```
{
    "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
    "logo": {
        "type": "file",
        "source": "~/ascii.txt",
        "color": {
            "1": "38;2;142;192;124"
        }
    },
    "display": {
        "color": {
            "keys": "458588"
        },
        "separator": "",
        // Constants are reusable strings referenced by {$1}, {$2}, etc.
        // These contain ANSI escape codes for cursor positioning
        "constants": [
            "──────────────────────────────────────────────", // {$1} - horizontal line for inner borders
            "\u001b[47D",                                     // {$2} - move cursor left 47 columns
            "\u001b[47C",                                     // {$3} - move cursor right 47 columns
            "\u001b[46C",                                     // {$4} - move cursor right 46 columns
            "══════════════════════════════════════════════"  // {$5} - horizontal line for outer borders
        ],
        "brightColor": false
    },
    "modules": [
        {
            "type": "version",
            "key": "╔═══════════════╦═{$5}╗\u001b[41D",
            "format": "\u001b[1m{#keys} {1} - {2} "
        },
        {
            "type": "os",
            // Key format breakdown for OS module:
            // "║  {icon}  \u001b[s{sysname}\u001b[u\u001b[10C│{$3}║{$2}"
            //
            // ║                    - Left border of key block
            //   {icon}             - OS icon (defined internally by fastfetch)
            //   \u001b[s           - ANSI escape: save cursor position (ESC[s)
            // {sysname}            - Format variable: system name (e.g., "Linux", "Darwin")
            // \u001b[u             - ANSI escape: restore cursor to saved position (ESC[u)
            //                        Necessary because the length of `{sysname}` differs between different platforms
            // \u001b[10C           - ANSI escape: move cursor right 10 columns (ESC[10C)
            // │                    - Right border of key block (always 10 columns from left border)
            // {$3}                 - Reference to constants[2]: move cursor right 47 columns
            // ║                    - Right border of value block
            // {$2}                 - Reference to constants[1]: move cursor left 47 columns
            //
            // This creates a fixed-width layout where the key block is exactly 10 columns wide,
            // regardless of the actual content length. The cursor manipulation ensures proper
            // alignment for the table-like structure.
            "key": "║  {icon}  \u001b[s{sysname}\u001b[u\u001b[10C║{$3}║{$2}"
        },
        {
            "type": "datetime",
            "key": "║  {icon}  Fetched   ║{$3}║{$2}",
            "format": "{year}-{month-pretty}-{day-pretty} {hour-pretty}:{minute-pretty}:{second-pretty} {timezone-name}"
        },
        {
            "type": "locale",
            "key": "║  {icon}  Locale    ║{$3}║{$2}"
        },

        // Hardware section with cyan color theme
        {
            "type": "custom",
            "key": "║{##458588}┌──────────────┬{$1}┐{#keys}║\u001b[37D",
            "format": "{##689d6a} Hardware "
        },
        {
            "type": "chassis",
            // Similar structure but with cyan color formatting:
            // │{##458588}│             - Left border with cyan color
            //  {icon}               - Chassis icon
            //  Chassis             - Fixed label text
            // │{$4}│{#keys}║{$2}    - Positioning and borders for value area
            "key": "║{##458588}│ {icon}  Chassis   │{$4}│{#keys}║{$2}"
        },
        {
            "type": "memory",
            "key": "║{##458588}│ {icon}  RAM       │{$4}│{#keys}║{$2}"
        },
        {
            "type": "swap",
            "key": "║{##458588}│ {icon}  SWAP      │{$4}│{#keys}║{$2}"
        },
        {
            "type": "cpu",
            "key": "║{##458588}│ {icon}  CPU       │{$4}│{#keys}║{$2}",
            "showPeCoreCount": true
        },
        {
            "type": "gpu",
            "key": "║{##458588}│ {icon}  GPU       │{$4}│{#keys}║{$2}"
        },
        {
                    "type": "disk",
                                "key": "║{##458588}│ {icon}  Disk      │{$4}│{#keys}║{$2}",
                                            "format": "{size-used} \/ {size-total} ({size-percentage}) - {filesystem}",
                                                        "folders": "/data:/storage/BC20-120B"
                                                                },

                                                                        {
            "type": "battery",
            "key": "║{##458588}│ {icon}  Battery   │{$4}│{#keys}║{$2}"
        },
        {
            "type": "custom",
            "key": "║{##458588}└──────────────┴{$1}┘{#keys}║",
            "format": ""
        },

        // Desktop section with green color theme
        {
            "type": "custom",
            "key": "║{##8ec07c}┌──────────────┬{$1}┐{#keys}║\u001b[37D",
            "format": "{##98971a} Desktop "
        },
        {
            "type": "de",
            "key": "║{##8ec07c}│ {icon}  Desktop   │{$4}│{#keys}║{$2}"
        },
        {
            "type": "wm",
            "key": "║{##8ec07c}│ {icon}  Session   │{$4}│{#keys}║{$2}"
        },
        {
            "type": "display",
            "key": "║{##8ec07c}│ {icon}  Display   │{$4}│{#keys}║{$2}",
            "compactType": "original-with-refresh-rate"
        },
        {
            "type": "command",
            "keyIcon": "󰍹",
            "key": "║{##8ec07c}│ {icon}  X11 Back  │{$4}│{#keys}║{$2}",
            "text": "result=$(xdpyinfo 2>/dev/null | awk -F': ' '/vendor string/ {print $2; exit}'); [ -n \"$result\" ] && echo \"$result\" || echo \"Unknown\""
        },
        {
            "type": "gpu",
            "key": "║{##8ec07c}│ {icon}  G-Driver  │{$4}│{#keys}║{$2}",
            "format": "{driver}"
        },
        {
            "type": "theme",
            "key": "║{##8ec07c}│ {icon}  Themes    │{$4}│{#keys}║{$2}"
        },
        {
            "type": "icons",
            "key": "║{##8ec07c}│ {icon}  Icons     │{$4}│{#keys}║{$2}"
        },
        {
            "type": "custom",
            "key": "║{##8ec07c}└──────────────┴{$1}┘{#keys}║",
            "format": ""
        },

        // Terminal section with yellow color theme
        {
            "type": "custom",
            "key": "║{##b8bb26}┌──────────────┬{$1}┐{#keys}║\u001b[37D",
            "format": "{##d79921} Terminal "
        },
        {
            "type": "shell",
            "key": "║{##b8bb26}│ {icon}  Shell     │{$4}│{#keys}║{$2}"
        },
        {
            "type": "terminal",
            "key": "║{##b8bb26}│ {icon}  Terminal  │{$4}│{#keys}║{$2}"
        },
        {
            "type": "terminalfont",
            "key": "║{##b8bb26}│ {icon}  Term Font │{$4}│{#keys}║{$2}"
        },
        {
            "type": "terminaltheme",
            "key": "║{##b8bb26}│ {icon}  Colors    │{$4}│{#keys}║{$2}"
        },
        {
            "type": "packages",
            "key": "║{##b8bb26}│ {icon}  Packages  │{$4}│{#keys}║{$2}"
        },
        {
            "type": "command",
            "keyIcon": "󰏖",
            "key": "║{##b8bb26}│ {icon}  Pkg Mgr   │{$4}│{#keys}║{$2}",
            "text": "if command -v pkg >/dev/null 2>&1; then echo \"pkg (Termux)\"; elif command -v pacman >/dev/null 2>&1; then echo \"pacman\"; elif command -v apt >/dev/null 2>&1; then echo \"apt\"; elif command -v dnf >/dev/null 2>&1; then echo \"dnf\"; elif command -v apk >/dev/null 2>&1; then echo \"apk\"; elif command -v xbps-install >/dev/null 2>&1; then echo \"xbps\"; elif command -v zypper >/dev/null 2>&1; then echo \"zypper\"; else echo \"Unknown\"; fi"
        },
        {
            "type": "custom",
            "key": "║{##b8bb26}└──────────────┴{$1}┘{#keys}║",
            "format": ""
        },

        // Development section with red color theme
        {
            "type": "custom",
            "key": "║{##fabd2f}┌──────────────┬{$1}┐{#keys}║\u001b[39D",
            "format": "{##cc241d} Development "
        },
        {
            "type": "command",
            "keyIcon": "",                                   // Custom icon override
            "key": "║{##fabd2f}│ {icon}  Rust      │{$4}│{#keys}║{$2}",
            "text": "rustc --version",
            "format": "rustc {~6,13}"                         // Print 6th to 13th characters (version number)
        },
        {
            "type": "command",
            "condition": {
                "!system": "Windows"                          // Posix version
            },
            "keyIcon": "",
            "key": "║{##fabd2f}│ {icon}  Clang     │{$4}│{#keys}║{$2}",
            "text": "clang --version | sed -n 's/.*version \\([0-9][0-9.]*\\).*/\\1/p'",
            "format": "clang {}"
        },
        {
            "type": "command",
            "condition": {
                "system": "Windows"                           // Windows version
            },
            "keyIcon": "",
            "key": "║{##fabd2f}│ {icon}  Clang     │{$4}│{#keys}║{$2}",
            "text": "clang --version | findstr version",      // Finds the line with "version"
            "format": "clang {~-6}"                           // Prints the last 6 characters (version number)
        },
        {
            "type": "command",
            "keyIcon": "",
            "key": "║{##fabd2f}│ {icon}  NodeJS    │{$4}│{#keys}║{$2}",
            "text": "node --version",
            "format": "node {~1}"                             // {~1} removes first character (v)
        },
        {
            "type": "command",
            "keyIcon": "",
            "key": "║{##fabd2f}│ {icon}  Go        │{$4}│{#keys}║{$2}",
            "text": "go version | cut -d' ' -f3",
            "format": "go {~2}"                               // {~2} removes first 2 characters (go)
        },
        {
            "type": "command",
            "keyIcon": "",
            "key": "║{##fabd2f}│ {icon}  Zig       │{$4}│{#keys}║{$2}",
            "text": "zig version",
            "format": "zig {}"
        },
        {
            "type": "editor",
            "key": "║{##fabd2f}│ {icon}  Editor    │{$4}│{#keys}║{$2}"
        },
        {
            "type": "command",
            "keyIcon": "󰊢",
            "key": "║{##fabd2f}│ {icon}  Git       │{$4}│{#keys}║{$2}",
            "text": "git version",
            "format": "git {~12}"
        },
        {
            "type": "font",
            "key": "║{##fabd2f}│ {icon}  Interface │{$4}│{#keys}║{$2}"
        },
        {
            "type": "custom",
            "key": "║{##fabd2f}└──────────────┴{$1}┘{#keys}║",
            "format": ""
        },

        // Uptime section with magenta color theme
        {
            "type": "custom",
            "key": "║{##b16286}┌──────────────┬{$1}┐{#keys}║\u001b[36D",
            "format": "{##d3869b} Uptime "
        },
        {
            "type": "uptime",
            "key": "║{##b16286}│ {icon}  Uptime    │{$4}│{#keys}║{$2}"
        },
        {
            "type": "users",
            "myselfOnly": true,                               // Only show current user
            "keyIcon": "",
            "key": "║{##b16286}│ {icon}  Login     │{$4}│{#keys}║{$2}"
        },

        {
            "type": "custom",
            "key": "║{##b16286}└──────────────┴{$1}┘{#keys}║",
            "format": ""
        },
        {
            "type": "custom",
            "key": "╚═════════════════{$5}╝",                // Bottom border of the entire layout
            "format": ""
        },

        // End with color palette and line break
        "break",                                             // Add a blank line
        "colors"                                             // Display color palette
    ]
}
```

for ASCII art for config (ascii.txt):
```
                    zzzzzzzzzzzzzzzzzzzz
                zzzzzzzzzzzzzzzzzzzzzzzzzzzz
             zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
          zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
        zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
       zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
     zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
    zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
   zzzzzzzzzzz{›—{zzzzzzzzzzzzzí{——››—{ízzzzzzzzzzzzzzzzz
  zzzzzzzzzzzzíí{› {zzzzzzzzí—  —{{íí{—› —ízzzzzzzzzzzzzzz
 zzzzzzzzzzzzzzzzz— {zzzzzz— ›{zzzzzzzzzí› —zzzzzzzzzzzzzzz
 zzzzzzzzzzzzzzzzzz ›zzzzz› {zzzzzzzzzzzzz— —zzzzzzzzzzzzzz
zzzzzzzzzzzzzzzzzzz ›zzzz{ —zzzzzzzzzzzzzzz› ízzzzzzzzzzzzzz
zzzzzzzzzzzzzzzzzzz ›zzzz{{zzzzzzzzzzzzzzzz{ —zzzzzzzzzzzzzz
zzzzzzzzzzzzzzzzzzz ›zzzzzzzzzzzzzzzzzzzzzz{ —zzzzzzzzzzzzzz
zzzzzzzzzzzzzzzzzzz ›zzzzzzzzzzzzzzzzzzzzí{ —zzzzzzzzzzzzzzz
zzzzzzzzzzzzzzzzzzz ›zzzzzzzzzí{—››       —{zzzzzzzzzzzzzzzz
zzzzzzzzzzzzzzzzzzz ›zzzzzzz{››—íízzzzzzzzzzzzzzzzzzzzzzzzzz
zzzzzzzzzzzzzzzzzzz ›zzzzzz› ízzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
zzzzzzzzzzzzzzzzzzz ›zzzzz ›ízzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
zzzzzzzzzzzzzzzzzzz ›zzzz{ {zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
 zzzzzzzzzzzzzzzzzz ›zzzz› ízzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
 zzzzzzzzzzzzzzzzzz ›zzzz› zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
  zzzzzzzzzzzzzzzzz ›zzzz› íííííííííííííííííízzzzzzzzzzzzz
   zzzzzzzzzzzzzzzz›—zzzz—›››››››››››››››››››{zzzzzzzzzzz
    zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
     zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
       zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
        zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
          zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
             zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz
                zzzzzzzzzzzzzzzzzzzzzzzzzzzz
                    zzzzzzzzzzzzzzzzzzzz
 _____________________
< Noot noot Penguins! >
 ---------------------
   \
    \
        .--.
       |o_o |
       |:_/ |
      //   \ \
     (|     | )
    /'\_   _/`\
    \___)=(___/
```
