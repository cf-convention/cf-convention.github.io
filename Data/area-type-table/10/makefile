clean:
	rm build/area-type-table.html

area-type-table:
	xsltproc xsl/html/area-type-table-1.1.xsl src/area-type-table.xml > build/area-type-table.html
	./get-title-version.py src/area-type-table.xml
