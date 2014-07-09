all: html

clean:
	rm -r build/*

standard-name-table:
	xsltproc xsl/html/cf-standard-name-table.xsl src/cf-standard-name-table.xml > build/cf-standard-name-table.html
	./inject-area-type-link.py build/cf-standard-name-table.html
	./get-title-version.py src/cf-standard-name-table.xml

area-type-table:
	xsltproc xsl/html/area-type-table.xsl src/area-type-table.xml > build/area-type-table.html	
	./get-title-version.py src/area-type-table.xml

guidelines:
	xsltproc xsl/html/guidelines.xsl src/guidelines.xml > build/guidelines.html
	./remove-second-title.py build/guidelines.html
	./get-title-version.py src/guidelines.xml

html:	standard-name-table area-type-table guidelines
