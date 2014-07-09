export XML_CATALOG_FILES = ~/Local/docbook-xsl-1.73.2

all:	html html-nochunks pdf encode rename remove-second-title

clean:
	rm -r build/*

html-nochunks:
	xsltproc xsl/html/docbook-custom.xsl docbooksrc/cf-conventions.xml > build/cf-conventions.html

html:
	xsltproc -stringparam base.dir build/ xsl/html/chunk-custom.xsl docbooksrc/cf-conventions.xml

fo:
	xsltproc xsl/fo/docbook-custom.xsl docbooksrc/cf-conventions.xml > build/cf-conventions.fo

pdf: fo
	fop build/cf-conventions.fo build/cf-conventions.pdf

encode:
	./encode.py build html

rename: 
	mv build/index.html build/cf-conventions-multi.html

remove-second-title:
	./remove-second-title.py build html
