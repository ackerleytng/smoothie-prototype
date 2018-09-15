JQUERY=2.2.3
FONTAWESOME=5.3.1
FONTS=fa-solid-900.ttf fa-solid-900.woff fa-solid-900.woff2
WEBFONTS=$(addprefix static/include/webfonts/,$(FONTS))

.PHONY: all clean jquery fontawesome

all: jquery fontawesome

jquery: static/include/js/jquery.min.js
fontawesome: static/include/css/fontawesome.css $(WEBFONTS)

static/include/js:
	mkdir -p static/include/js

static/include/css:
	mkdir -p static/include/css

static/include/webfonts:
	mkdir -p static/include/webfonts


static/include/js/jquery.min.js: static/include/js
	curl https://code.jquery.com/jquery-$(JQUERY).min.js -o $@

static/include/css/fontawesome.css: static/include/css
	curl https://use.fontawesome.com/releases/v$(FONTAWESOME)/css/all.css -o $@

static/include/webfonts/%: static/include/webfonts
	curl https://use.fontawesome.com/releases/v$(FONTAWESOME)/webfonts/$* -o $@


clean:
	rm -rf static/include
