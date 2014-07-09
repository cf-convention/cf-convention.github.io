all:	html html-nochunks pdf encode rename remove-second-title

clean:
	rm -rf build/*
	rm -f docbooktmp/*

SRCS1:=$(wildcard docbooksrc/*.xml)
SRCS:=$(filter-out docbooksrc/cf-conventions.xml, $(SRCS1))
TRGS:=$(patsubst docbooksrc/%.xml, docbooktmp/%.xml ,$(SRCS))
docbooktmp/%.xml: docbooksrc/%.xml
	tail -n +4 $< > $@

stripxml: $(TRGS)
	cp docbooksrc/cf-conventions.xml docbooktmp/

html-nochunks: stripxml
	xsltproc xsl/html/docbook-custom.xsl docbooktmp/cf-conventions.xml > build/cf-conventions.html

html: stripxml
	xsltproc -stringparam base.dir build/ xsl/html/chunk-custom.xsl docbooktmp/cf-conventions.xml

fo: stripxml
	xsltproc xsl/fo/docbook-custom.xsl docbooktmp/cf-conventions.xml > build/cf-conventions.fo

pdf: fo
	fop build/cf-conventions.fo build/cf-conventions.pdf

encode:
	./encode.py build html

rename: 
	mv build/index.html build/cf-conventions-multi.html

remove-second-title:
	./remove-second-title.py build html
