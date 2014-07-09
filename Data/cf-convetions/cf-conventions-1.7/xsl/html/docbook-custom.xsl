<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'>

    <xsl:import href="../../../../docbook-xsl-1.73.2/html/docbook.xsl"/>
    
    <!-- Customizations common to all output formats -->
    <xsl:import href="../common/common-custom.xsl"/>

    <!-- Customized titlepage template suppresses revhistory -->
    <xsl:import href="titlepage-templates-custom.xsl"/>
    
    <!-- The newtext,deletedtext,and commenttext support was modified from fo
    without much understanding, so there's probably garbage in here. -->
    <!-- Add support for newtext class -->
    <xsl:template match="para[@role='newtext'] | simplesect[@role='newtext']">
        <block xsl:use-attribute-sets="normal.para.spacing"
            background-color="#ffccff">
            <xsl:apply-templates/>
        </block>
    </xsl:template>

    <xsl:template match="emphasis[@role='newtext']">
        <font style="background-color:#ffccff">
            <xsl:apply-templates/>
        </font>
    </xsl:template>


    <!-- Add support for deletedtext class -->
    <xsl:template match="para[@role='deletedtext']">
        <block xsl:use-attribute-sets="normal.para.spacing"
            background-color="#ffff88"
            text-decoration="line-through">        
            <xsl:apply-templates/>
        </block>
    </xsl:template> 

    <xsl:template match="emphasis[@role='deletedtext']">
        <font style="background-color:#ffff88; text-decoration:line-through">
            <xsl:apply-templates/>
        </font>
    </xsl:template>


    <!-- Add support for commenttext class --> 
    <xsl:template match="para[@role='commenttext']">
        <block xsl:use-attribute-sets="normal.para.spacing"
            background-color="#88ff88"
            font-style="italic">
            <xsl:apply-templates/>
        </block>
    </xsl:template>

    <xsl:template match="emphasis[@role='commenttext']">
        <font style="background-color:#88ff88; font-style:italic">
            <xsl:apply-templates/>
        </font>
    </xsl:template>
 
</xsl:stylesheet>
