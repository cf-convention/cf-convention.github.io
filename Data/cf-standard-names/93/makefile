clean:
	rm build/cf-standard-name-table.html
	rm build/kwic_index_for_cf_standard_names.html

standard-name-table:
	xsltproc xsl/html/cf-standard-name-table-1.3.xsl src/cf-standard-name-table.xml > build/cf-standard-name-table.html
	./inject-area-type-link.py build/cf-standard-name-table.html

kwic-index:
	./kwic_edit src/cf-standard-name-table.xml
