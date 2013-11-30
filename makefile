.SUFFIXES: .coffee .js
.PHONY: all clean

COFFEE_CMD = coffee
COFFEE_DIR = ./coffee
COFFEE_FILES := $(wildcard $(COFFEE_DIR)/*.coffee)
GEN_JS = $(patsubst $(COFFEE_DIR)/%.coffee,%.js,$(COFFEE_FILES))

all: $(GEN_JS)

%.js: $(COFFEE_DIR)/%.coffee
	$(COFFEE_CMD) -o . -c $<

zip: all
#	zip launcher.zip *.js manifest.json *.html lib/* lib/dicts/* icons/* css/*
	zip launcher.zip *.js manifest.json *.html lib/* icons/*

crx: all

clean:
	rm -f $(GEN_JS) launcher.zip launcher.crx