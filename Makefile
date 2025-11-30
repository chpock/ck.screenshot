SOURCE = src/ck.screenshot
ROFI_THEMES = area main save

ROFI_THEME_FILES = $(addsuffix .rasi,$(addprefix src/,$(ROFI_THEMES)))

all: ck.screenshot

ck.screenshot: $(SOURCE) $(ROFI_THEME_FILES)
	cp -f "$<" "$@"
	for THEME_FILE in $(wordlist 2,$(words $^),$^); do { \
	    echo; \
	    echo "--- $$(basename "$$THEME_FILE")"; \
	    cat "$$THEME_FILE"; \
	    echo "---"; \
	} >> "$@"; done
	chmod +x "$@"
