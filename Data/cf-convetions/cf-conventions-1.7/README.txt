These DocBook XML files are used to build the CF Conventions document.

See the makefile for the avilable document build options.

The full DocBook XSLT distribution is not included here, so it is downloaded
as-needed by xsltproc.

Several simple customizations were made to the default stylesheet parameters to 
make the documents look nice (section numbering, page breaks, URLs-as-footnotes, etc).

More complex customizations were made to put the document revision history in
its own appendix and to eliminate a blank page before the TOC.

Customized Title Pages for FO and HTML:
-------------------------
To re-generate xslt/fo/titlepage-templates-custom.xsl from the xslt/fo/titlepage.templates.xml spec file, run:
xsltproc -output xslt/fo/titlepage-templates-custom.xsl xslt/template/titlepage.xsl xslt/fo/titlepage.templates.xml

To re-generate xslt/html/titlepage-templates-custom.xsl from the xslt/html/titlepage.templates.xml spec file, run:
xsltproc -output xslt/html/titlepage-templates-custom.xsl xslt/template/titlepage.xsl xslt/html/titlepage.templates.xml

For full details, see:
http://www.sagehill.net/docbookxsl/HTMLTitlePage.html
