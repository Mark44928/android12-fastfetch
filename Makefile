# android12-fastfetch — Makefile
# Fastfetch JSONC config + logo. Requires fastfetch >= 2.51; the $schema is
# pinned to the 2.71.0 tag. The logo loads from $HOME, so copy ascii.txt
# there first (or set FASTFETCH_ASCII_PATH).
#
#   make check    config + every preset render via fastfetch --pipe
#   make clean    remove nothing (config is checked in)

PYTHON ?= python3
export TMPDIR ?= /data/data/com.termux/files/usr/tmp
FF ?= fastfetch
ASCII_SRC ?= ascii.txt

.PHONY: check render

# Copy the logo to $HOME so fastfetch finds it (it loads from $HOME by name).
check:
	cp "$(ASCII_SRC)" "$$HOME/ascii.txt"
	$(FF) -c config.jsonc --pipe
	@for preset in presets/*.jsonc; do \
		echo "rendering $$preset"; \
		$(FF) -c "$$preset" --pipe >/dev/null; \
	done
	bash tests/install-smoke.sh

render:
	$(FF) -c config.jsonc --pipe

clean:
	@true