<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <html>
        <xsl:apply-templates/>
        </html>
    </xsl:template>

    <xsl:template match="area_type_table">
        <head>
        <!-- Put something useful into the Title -->
        <title>CF area types</title>

        <h1 class="documentFirstHeading">CF Area Type Table</h1>

        <!-- This page requires an external javascript which is included by Plone -->
        <!-- See: /usr/local/zopeinstance1/Products/CMFPlone/skins/plone_ecmascript/toggleHelp.js -->
        <script>
                        
            function toggleHelp(standard_name)
            {
                // check for the existence of the help tr object for this standard_name
                var helpDiv = document.getElementById(standard_name + '_help');
                
                if (helpDiv)
                {
                    if (helpDiv.style.display != 'none')
                    {
                        helpDiv.style.display = 'none';
                        
                        curArrow = document.getElementById(standard_name + '_arrow');
                        curArrow.src = '../build/media/images/arrow_right.gif';
                    }
                    else
                    {
                        helpDiv.style.display = '';
                        
                        curArrow = document.getElementById(standard_name + '_arrow');
                        curArrow.src = '../build/media/images/arrow_down.gif';
                    }
                }
            }
            
            
            function showHelp(standard_name)
            {
                var helpDiv = document.getElementById(standard_name + '_help');
                
                if (helpDiv)
                {
                    helpDiv.style.display = '';
                    curArrow = document.getElementById(standard_name + '_arrow');
                    curArrow.src = '../build/media/images/arrow_down.gif';
                }
            }
            
            function hideHelp(standard_name)
            {
                var helpDiv = document.getElementById(standard_name + '_help');
                
                if (helpDiv)
                {
                    helpDiv.style.display = 'none';
                    curArrow = document.getElementById(standard_name + '_arrow');
                    curArrow.src = '../build/media/images/arrow_right.gif';
                }
            }
            
        </script>
        
        </head>
        <body>
            <b>Version <xsl:value-of select="version_number"/>, <xsl:value-of select="date"/></b>
            <br/>
            <table id="area_type_table" border="1" width="100%" cellpadding="2" cellspacing="0">
                <th width="100%">Area Type</th>
                <xsl:apply-templates select="entry"/>
            </table>            
        </body>
    </xsl:template>

    <xsl:template match="entry">
        <tr>
            <xsl:attribute name="id"><xsl:value-of select="@id"/>_tr</xsl:attribute>
            
            <td>
                <a>
                    <xsl:attribute name="name">
                        <xsl:value-of select="@id"/>
                    </xsl:attribute>
                </a>
                <img>
                    <xsl:attribute name="id"><xsl:value-of select="@id"/>_arrow</xsl:attribute>
                    <xsl:attribute name="src">../build/media/images/arrow_right.gif</xsl:attribute>
                </img>
                <code class="varname">
                    <a>
                        <xsl:attribute name="href">javascript:void(0)</xsl:attribute>
                        <xsl:attribute name="onclick">toggleHelp('<xsl:value-of select="@id"/>')</xsl:attribute>
                        <xsl:value-of select="@id"/>
                    </a>
                </code>
                <xsl:variable name="area_type_id" select="@id"/>
                <xsl:apply-templates select="../alias[entry_id=$area_type_id]"/>
                
                <div>
                    <xsl:attribute name="id"><xsl:value-of select="@id"/>_help</xsl:attribute>
                    <xsl:attribute name="style">display: none; padding-left: 16px; margin-top: 4px; border-top: 1px dashed #cccccc;</xsl:attribute>
                    
                    <xsl:choose>
                        <xsl:when test="description=''">
                            No help available.
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="description"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </div>
                
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="alias">
        <div style="padding-left: 16px;"><i>alias:</i>&#160;<xsl:value-of select="@id"/></div>
    </xsl:template>
    
</xsl:stylesheet>
