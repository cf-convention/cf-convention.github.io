<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version='1.0'>

    <xsl:import href="../../../../docbook-xsl-1.73.2/fo/docbook.xsl"/>
    
    <!-- Customized titlepage template eliminates blank page between the verso and the TOC -->
    <xsl:import href="titlepage-templates-custom.xsl"/>

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

    <!-- Make xrefs and links blue -->
    <xsl:attribute-set name="xref.properties">
        <xsl:attribute name="color">blue</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- Make revision history header entries bold -->
    <xsl:attribute-set name="revhistory.table.cell.properties">
        <xsl:attribute name="font-weight">bold</xsl:attribute>
        <xsl:attribute name="font-size">14pt</xsl:attribute>
        <xsl:attribute name="padding-bottom">8pt</xsl:attribute>
    </xsl:attribute-set>
    
    <!-- Custom Revision History template -->
    <!-- Do not display the "Revision History" title -->
    <xsl:template match="revhistory" mode="titlepage.mode">
      <xsl:variable name="explicit.table.width">
        <xsl:call-template name="dbfo-attribute">
          <xsl:with-param name="pis"
                          select="processing-instruction('dbfo')"/>
          <xsl:with-param name="attribute" select="'table-width'"/>
        </xsl:call-template>
      </xsl:variable>
    
      <xsl:variable name="table.width">
        <xsl:choose>
          <xsl:when test="$explicit.table.width != ''">
            <xsl:value-of select="$explicit.table.width"/>
          </xsl:when>
          <xsl:when test="$default.table.width = ''">
            <xsl:text>100%</xsl:text>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="$default.table.width"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:variable>
    
      <fo:table table-layout="fixed" width="{$table.width}" xsl:use-attribute-sets="revhistory.table.properties">
        <fo:table-column column-number="1" column-width="proportional-column-width(1)"/>
        <fo:table-column column-number="2" column-width="proportional-column-width(1)"/>
        <fo:table-body start-indent="0pt" end-indent="0pt">
          <xsl:apply-templates mode="titlepage.mode"/>
        </fo:table-body>
      </fo:table>
    </xsl:template>

    
    
    <!-- Customized Revision History / Revision template -->
    <!-- Reference the attribute set revhistory.revremark.table.cell.properties -->
    <!-- Copied from xslt/fo/titlepage.xsl -->
    <xsl:template match="revhistory/revision" mode="titlepage.mode">
        <xsl:variable name="revnumber" select="revnumber"/>
        <xsl:variable name="revdate"   select="date"/>
        <xsl:variable name="revauthor" select="authorinitials|author"/>
        <xsl:variable name="revremark" select="revremark|revdescription"/>
        <fo:table-row>
            <fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
                <fo:block>
                    <xsl:apply-templates select="$revdate[1]" mode="titlepage.mode"/>
                </fo:block>
            </fo:table-cell>
            <fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
                <fo:block>
                    <xsl:for-each select="$revauthor">
                        <xsl:apply-templates select="." mode="titlepage.mode"/>
                        <xsl:if test="position() != last()">
                            <xsl:text>, </xsl:text>
                        </xsl:if>
                    </xsl:for-each>
                </fo:block>
            </fo:table-cell>
        </fo:table-row>
        <xsl:if test="$revremark">
            <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="revhistory.revremark.table.cell.properties">
                    <fo:block>
                        <xsl:apply-templates select="$revremark[1]" mode="titlepage.mode"/>
                    </fo:block>
                </fo:table-cell>
            </fo:table-row>
        </xsl:if>
    </xsl:template>


    <!-- Add support for revision history in its own appendix -->
    <xsl:template match="appendix[@id='revhistory']/para">
        <xsl:apply-templates select="//revhistory" mode="titlepage.mode"/>
    </xsl:template>


    <!-- Add support for newtext class -->
    <xsl:template match="para[@role='newtext'] | simplesect[@role='newtext']">
        <fo:block xsl:use-attribute-sets="normal.para.spacing"
            background-color="#ffccff">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>

    <xsl:template match="emphasis[@role='newtext']">
        <fo:inline
            background-color="#ffccff">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>


    <!-- Add support for deletedtext class -->
    <xsl:template match="para[@role='deletedtext']">
        <fo:block xsl:use-attribute-sets="normal.para.spacing"
            background-color="#ffff88"
            text-decoration="line-through">        
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template> 

    <xsl:template match="emphasis[@role='deletedtext']">
        <fo:inline
            background-color="#ffff88"
            text-decoration="line-through">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>


    <!-- Add support for commenttext class --> 
    <xsl:template match="para[@role='commenttext']">
        <fo:block xsl:use-attribute-sets="normal.para.spacing"
            background-color="#88ff88"
            font-style="italic">
            <xsl:apply-templates/>
        </fo:block>
    </xsl:template>
 
    <xsl:template match="emphasis[@role='commenttext']">
        <fo:inline
            background-color="#88ff88"
            font-style="italic">
            <xsl:apply-templates/>
        </fo:inline>
    </xsl:template>

</xsl:stylesheet>
