clean:
	rm build/cf-standard-name-table.html

standard-name-table:
	xsltproc xsl/html/cf-standard-name-table-1.3.xsl src/cf-standard-name-table.xml > build/cf-standard-name-table.html
	./inject-area-type-link.py build/cf-standard-name-table.html
