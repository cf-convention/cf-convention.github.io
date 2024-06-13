<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <html>
        <xsl:apply-templates/>
        </html>
    </xsl:template>

    <xsl:template match="standardized_region_list">
        <head>
        <!-- Put something useful into the Title -->
        <title>CF Standardized Region List</title>

        <h1 class="documentFirstHeading">CF Standardized Region List</h1>

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
                        curArrow.src = './arrow_right.gif';
                    }
                    else
                    {
                        helpDiv.style.display = '';
                        
                        curArrow = document.getElementById(standard_name + '_arrow');
                        curArrow.src = './arrow_down.gif';
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
                    curArrow.src = './arrow_down.gif';
                }
            }
            
            function hideHelp(standard_name)
            {
                var helpDiv = document.getElementById(standard_name + '_help');
                
                if (helpDiv)
                {
                    helpDiv.style.display = 'none';
                    curArrow = document.getElementById(standard_name + '_arrow');
                    curArrow.src = './arrow_right.gif';
                }
            }
            
        </script>
        
        </head>
        <body>
            <b>Version <xsl:value-of select="version_number"/>, <xsl:value-of select="date"/></b>
            <br/>
            <br/>
Version 1 of this list was based on the NASA GCMD keyword list for locations which was valid on 12 December 2002. We retained only the names of geographical regions from the GCMD list, changing them to lower case and replacing the separators within the names by underscores to be consistent with the style used for CF standard names. We excluded: (a) countries (these could be added if required); (b) regions that could be specified by coordinate ranges in CF (e.g. western hemisphere); (c) ill-defined regions (e.g. west Africa); (d) names for layers and surfaces of the Earth (e.g. mantle, sea floor), which are or would be included in standard names if required. Within the CF conventions we have added a number of new names, constructed using the same style. Our intention is to keep this list consistent with GCMD.<br/><br/>
            <table id="standardized_region_list" border="1" width="100%" cellpadding="2" cellspacing="0">
                <th width="100%">Region name</th>
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
                    <xsl:attribute name="src">./arrow_right.gif</xsl:attribute>
                </img>
                <code class="varname">
                    <a>
                        <xsl:attribute name="href">javascript:void(0)</xsl:attribute>
                        <xsl:attribute name="onclick">toggleHelp('<xsl:value-of select="@id"/>')</xsl:attribute>
                        <xsl:value-of select="@id"/>
                    </a>
                </code>
                <xsl:variable name="region_name_id" select="@id"/>
                <xsl:apply-templates select="../alias[entry_id=$region_name_id]"/>
                
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
