#!/data/data/com.termux/files/usr/bin/env python3
"""android12-fastfetch preset helper — list and preview fastfetch presets.

Usage:
    python3 cli.py                  # list presets
    python3 cli.py list             # list presets
    python3 cli.py show <preset>    # print a preset's JSONC
"""

import os
import sys

HERE = os.path.dirname(os.path.abspath(__file__))
PRESETS = os.path.join(HERE, "presets")


def list_presets():
    names = sorted(f[:-6] for f in os.listdir(PRESETS) if f.endswith(".jsonc"))
    print("presets: " + ", ".join(names))
    for n in names:
        print(f"  {n}")


def show(name):
    path = os.path.join(PRESETS, name + ".jsonc")
    if not os.path.isfile(path):
        print(f"no preset '{name}' (try: {', '.join(sorted(f[:-6] for f in os.listdir(PRESETS) if f.endswith('.jsonc')))})", file=sys.stderr)
        return 1
    with open(path, encoding="utf-8") as fh:
        print(fh.read())
    return 0


def main(argv):
    cmd = argv[0] if argv else "list"
    if cmd == "list":
        list_presets()
        return 0
    if cmd == "show":
        return show(argv[1]) if len(argv) > 1 else 2
    print(__doc__)
    return 2


if __name__ == "__main__":
    sys.exit(main(sys.argv[1:]))