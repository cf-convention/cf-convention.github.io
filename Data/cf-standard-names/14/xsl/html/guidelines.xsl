<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

    <xsl:import href="http://docbook.sourceforge.net/release/xsl/1.73.2/html/docbook.xsl"/>

    <!-- Table titles without number labels. -->
    <xsl:param name="local.l10n.xml" select="document('')"/>
      <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
        <l:l10n language="en">
          <l:context name="title">
            <l:template name="table" text="%t"/>
          </l:context>
          <l:context name="xref-number-and-title">
            <l:template name="table" text="the table titled &#8220;%t&#8221;"/>
          </l:context>
        </l:l10n>
      </l:i18n>
    <xsl:template match="table" mode="label.markup"/>

</xsl:stylesheet>
