JQUERY=2.2.3
FONTAWESOME=5.3.1
FONTS=fa-solid-900.ttf fa-solid-900.woff fa-solid-900.woff2
WEBFONTS=$(addprefix include/webfonts/,$(FONTS))
GOOGLEFONT=$(shell curl --silent 'https://fonts.googleapis.com/css?family=Fjalla+One' | perl -ne 'print $$1 if /url\((.*?)\)/')

.PHONY: all clean jquery fontawesome googlefont

all: jquery fontawesome googlefont

jquery: include/js/jquery.min.js
fontawesome: include/css/fontawesome.css $(WEBFONTS)
googlefont: include/fonts/fjalla-one.ttf

include/js include/css include/fonts include/webfonts:
	mkdir -p $@

include/js/jquery.min.js: include/js
	curl https://code.jquery.com/jquery-$(JQUERY).min.js -o $@

include/css/fontawesome.css: include/css
	curl https://use.fontawesome.com/releases/v$(FONTAWESOME)/css/all.css -o $@

include/webfonts/%: include/webfonts
	curl https://use.fontawesome.com/releases/v$(FONTAWESOME)/webfonts/$* -o $@

include/fonts/fjalla-one.ttf: include/fonts
	curl -o $@ $(GOOGLEFONT)


clean:
	rm -rf include
