<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'>

    <!-- Use section numbering for 1 depth level in the document tree -->
    <xsl:param name="section.autolabel" select="1"></xsl:param>
    <xsl:param name="section.label.includes.component.label" select="1"></xsl:param>
    
    <!-- Causes variablelists to display like html dt, dl -->
    <xsl:param name="variablelist.as.blocks" select="1"/>

    <!-- This allows tables and other block objects to wrap across multiple pages --> 
    <xsl:attribute-set name="formal.object.properties">
        <xsl:attribute name="keep-together.within-column">auto</xsl:attribute>
    </xsl:attribute-set>

    <!-- Set left and right margins -->
    <xsl:param name="page.margin.inner">1.0in</xsl:param>
    <xsl:param name="page.margin.outer">1.0in</xsl:param>

    <!-- Don't indent the body text, as it wastes paper! -->
    <xsl:param name="body.start.indent">0pt</xsl:param>

    <!-- Display URLs as footnotes, rather than inline -->
    <xsl:param name="ulink.footnotes">1</xsl:param>
    
    <!-- Add some space above the revision history table -->
    <xsl:attribute-set name="revhistory.table.properties">
        <xsl:attribute name="space-before.minimum">1em</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- Custom attribute set to indent revision history table cells -->
    <xsl:attribute-set name="revhistory.revremark.table.cell.properties">
        <xsl:attribute name="padding-left">14pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">8pt</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- Make revision history header entries bold -->
    <xsl:attribute-set name="revhistory.table.cell.properties">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">14pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">8pt</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- Add support for revision history in its own appendix -->
    <xsl:template match="appendix[@id='revhistory']/para">
        <xsl:apply-templates select="//revhistory" mode="titlepage.mode"/>
    </xsl:template>

    
</xsl:stylesheet>