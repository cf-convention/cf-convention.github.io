<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template match="/">
        <html>
        <xsl:apply-templates/>
        </html>
    </xsl:template>

    <xsl:template match="standard_name_table">
        <!-- Put something useful into the Title -->
        <title>CF Standard Names</title>


    <head>
    <title>
        cf-standard-name-table.html
    </title>

        <h1 class="documentFirstHeading">CF Standard Name Table</h1>

    <div class="documentByLine">

        <div class="reviewHistory">
        </div>

    </div>


    <div class="plain">


        <!-- This page requires an external javascript which is included by Plone -->
        <!-- See: /usr/local/zopeinstance1/Products/CMFPlone/skins/plone_ecmascript/toggleHelp.js -->
        <script>
            
            function applyFilter(filter_text)
            {
                // applying a filter hides all standard names not matching filter_text
                // if filter_text contains no spaces, it is treated as a regexp
                // otherwise, all substrings must occur somewhere
                var is_match = false;
                var search_type = 'regexp';
                var search_help_text = false;
                var num_matches = 0;
                var is_boolean_and = true;
                
                search_help_text = (document.getElementById('search_help_text').checked);
                is_boolean_and = (document.getElementById('logical_operator_and').checked);
                
                if (filter_text.indexOf(' ') == -1)
                {
                    search_type = 'regexp';
                    var re = new RegExp(filter_text, 'i')
                }
                else
                {
                    search_type = 'string';
                    var string_parts = filter_text.split(' ');
                }
                
                curTable = document.getElementById('standard_name_table');
                allTRs = curTable.getElementsByTagName('tr');
                
                for (var i = 0; i &lt; allTRs.length; i++)
                {
                    curTR = allTRs[i];
                    
                    if (curTR.id != '')
                    {
                        if (search_type == 'regexp')
                        {
                            is_match = curTR.id.substring(0, curTR.id.length - 3).match(re);
                            if (search_help_text)
                            {
                                var helpText = document.getElementById(curTR.id.substring(0,curTR.id.length - 3) + '_help').innerHTML;
                                is_match = is_match || helpText.match(re);
                            }
                        }
                        else
                        {
                            if (is_boolean_and)
                            {
                                var is_name_match = true;
                                for (var j = 0; j &lt; string_parts.length &amp;&amp; is_name_match; j++)
                                {
                                    if (!curTR.id.match(new RegExp(string_parts[j], 'i')))
                                    {
                                        is_name_match = false;
                                    }
                                }
                            }
                            else
                            {
                                var is_name_match = false;
                                for (var j = 0; j &lt; string_parts.length &amp;&amp; !is_name_match; j++)
                                {
                                    if (curTR.id.substring(0, curTR.id.length - 3).match(new RegExp(string_parts[j], 'i')))
                                    {
                                        is_name_match = true;
                                    }
                                }
                            }
                            is_match = is_name_match;
                            
                            if (search_help_text)
                            {
                                var helpText = document.getElementById(curTR.id.substring(0,curTR.id.length - 3) + '_help').innerHTML;
                                
                                if (is_boolean_and)
                                {
                                    var is_help_match = true;
                                    for (var j = 0; j &lt; string_parts.length &amp;&amp; is_help_match; j++)
                                    {
                                        if (!helpText.match(new RegExp(string_parts[j], 'i')))
                                        {
                                            is_help_match = false;
                                        }
                                    }
                                }
                                else
                                {
                                    var is_help_match = false;
                                    for (var j = 0; j &lt; string_parts.length &amp;&amp; !is_help_match; j++)
                                    {
                                        if (helpText.match(new RegExp(string_parts[j], 'i')))
                                        {
                                            is_help_match = true;
                                        }
                                    }
                                }
                                is_match = is_match || is_help_match;
                            }
                        }
                        if (!is_match)
                        {
                            curTR.style.display = 'none';
                        }
                        else
                        {
                            num_matches++;
                            
                            curTR.style.display = '';
                            if (search_help_text)
                            {
                                showHelp(curTR.id.substring(0,curTR.id.length - 3));
                            }
                            else
                            {
                                hideHelp(curTR.id.substring(0,curTR.id.length - 3));
                            }
                        }
                    }
                }
                
                var filter_matches = document.getElementById('filter_matches');
                var filter_matches_num = document.getElementById('filter_matches_num');
                var filter_matches_query = document.getElementById('filter_matches_query');
                
                if (filter_text != '')
                {
                    filter_matches.style.visibility = 'visible';
                    filter_matches_num.innerHTML = num_matches;
                    filter_matches_query.innerHTML = filter_text;
                }
                else
                {
                    filter_matches.style.visibility = 'hidden';
                }
                
            }
            
            function clearFilter()
            {
                curTable = document.getElementById('standard_name_table');
                allTRs = curTable.getElementsByTagName('tr');
                
                for (var i = 0; i &lt; allTRs.length; i++)
                {
                    curTR = allTRs[i];
                    curTR.style.display = '';
                }
                
                var filter_matches = document.getElementById('filter_matches');
                filter_matches.style.visibility = 'hidden';
                
                document.getElementById('filter_text').value = '';
            }
            
            
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
    </div>
        
        </head>
        <body>
	  <b>Version <xsl:value-of select="version_number"/>,
          <xsl:element name="newdate">
            <xsl:call-template name="FormatDate">
              <xsl:with-param name="DateTime" select="last_modified"/>
	    </xsl:call-template>
          </xsl:element> </b>
          <br/>
          <br/>
Refer to the <span class="link-external"><a href="http://cfconventions.org/Data/cf-standard-names/docs/guidelines.html">Guidelines for Construction of CF Standard Names</a></span> for information on how the names are constructed and interpreted, and how new names could be derived.
          <br/>
          <br/>
<b>A note about units</b><br/>
The canonical units associated with each standard name are usually the SI units for the quantity. <span class="link-external"><a href="http://cfconventions.org/cf-conventions/cf-conventions.html#standard-name">Section 3.3 of the CF conventions</a></span> states: "Unless it is dimensionless, a variable with a standard_name attribute must have units which are physically equivalent (not necessarily identical) to the canonical units, possibly modified by an operation specified by either the standard name modifier ... or by the cell_methods attribute." Furthermore, <span class="link-external"><a href="http://cfconventions.org/cf-conventions/cf-conventions.html#_overview"> Section 1.3 of the CF conventions</a></span> states: "The values of the units attributes are character strings that are recognized by UNIDATA's Udunits package [UDUNITS], (with exceptions allowed as discussed in Section 3.1, “Units”)." For example, a variable with the standard name of "air_temperature" may have a units attribute of "degree_Celsius" because Celsius can be converted to Kelvin by Udunits. For the full range of supported units, refer to the <a href="https://www.unidata.ucar.edu/software/udunits/udunits-current/doc/udunits/udunits2.html#Database"> Udunits documentation</a>. Refer to the <a href="http://cfconventions.org/cf-conventions/cf-conventions.html"> CF conventions</a> for full details of the units attribute.<br/><br/>
            <div style="border: 1px solid rgb(153, 153, 153); background-color: rgb(204, 204, 204); padding-top: 10px; padding-left: 10px; padding-bottom: 10px; margin-bottom: 10px;">
                <h2>Search</h2>
                <form id="filter_form" name="filter_form" style="margin: 0px; padding: 0px;" action="javascript:void(0);">
                    <table border="0" cellpadding="2" cellspacing="1">
                        <tbody>
                            <tr>
                                <td valign="top">
                                    <input id="filter_text" name="filter_text" size="40" 
                                           onkeydown="if (event.keyCode==13) applyFilter(document.getElementById('filter_text').value);" 
                                           type="text"/>&#160;&#160;
                                    <input value="Search Standard Names" 
                                           id="btn_search" 
                                           onclick="applyFilter(document.getElementById('filter_text').value);" 
                                           type="button"/>&#160;&#160;
                                    <input value="Show All Standard Names" 
                                           id="btn_show_all" 
                                           onclick="clearFilter();return false;" 
                                           type="button"/>
                                    <br/>
                                    <label><input type="radio" 
                                                  name="logical_operator" 
                                                  id="logical_operator_and" 
                                                  value="AND" 
                                                  checked="checked"/> AND</label> 
                                    <label><input type="radio" 
                                                  name="logical_operator" 
                                                  id="logical_operator_or" 
                                                  value="OR"/> OR</label> (separate search terms with spaces)
                                    <br/>
                                    <label><input id="search_help_text" 
                                                  name="search_help_text" 
                                                  type="checkbox"/> Also search help text</label>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form>
                
                <div id="filter_matches" style="visibility: hidden; margin-bottom: 10px;">
                    Found <span id="filter_matches_num"></span> standard names matching query: <span id="filter_matches_query"></span>
                </div>
                
                <h2>View by Category</h2>
                <table cellpadding="4" cellspacing="0" border="1">
                    <tr>
                        <td>
                            <a href="javascript:void(0)" 
                               onclick="document.getElementById('filter_text').value='aerosol dry.*deposition wet.*deposition production emission mole'; 
                               document.getElementById('logical_operator_or').click(); 
                               document.getElementById('btn_search').onclick();">Atmospheric Chemistry</a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" 
                               onclick="document.getElementById('filter_text').value='air_pressure atmosphere.*vorticity atmosphere.*streamfunction wind momentum.*in_air gravity_wave ertel geopotential omega atmosphere.*dissipation atmosphere.*energy atmosphere.*drag atmosphere.*stress surface.*stress'; 
                               document.getElementById('logical_operator_or').click(); 
                               document.getElementById('btn_search').onclick();">Atmosphere Dynamics</a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" 
                               onclick="document.getElementById('filter_text').value='carbon leaf vegetation'; 
                               document.getElementById('logical_operator_or').click(); 
                               document.getElementById('btn_search').onclick();">Carbon Cycle</a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" 
                               onclick="document.getElementById('filter_text').value='cloud'; 
                               document.getElementById('logical_operator_or').click(); 
                               document.getElementById('btn_search').onclick();">Cloud</a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" 
                               onclick="document.getElementById('filter_text').value='atmosphere_water canopy_water precipitation rain snow moisture freshwater runoff root humidity transpiration evaporation water_vapour river'; 
                               document.getElementById('logical_operator_or').click(); 
                               document.getElementById('btn_search').onclick();">Hydrology</a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <a href="javascript:void(0)" 
                               onclick="document.getElementById('filter_text').value='ocean.*streamfunction sea_water_velocity ocean.*vorticity'; 
                               document.getElementById('logical_operator_or').click(); 
                               document.getElementById('btn_search').onclick();">Ocean Dynamics</a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" 
                               onclick="document.getElementById('filter_text').value='radiative longwave shortwave brightness radiance albedo'; 
                               document.getElementById('logical_operator_or').click(); 
                               document.getElementById('btn_search').onclick();">Radiation</a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" 
                               onclick="document.getElementById('filter_text').value='sea_ice'; 
                               document.getElementById('logical_operator_or').click(); 
                               document.getElementById('btn_search').onclick();">Sea Ice</a>
                        </td>
                        <td>
                            <a href="javascript:void(0)" 
                               onclick="document.getElementById('filter_text').value='surface'; 
                               document.getElementById('logical_operator_or').click(); 
                               document.getElementById('btn_search').onclick();">Surface</a>
                        </td>
                    </tr>
                </table>
                
            </div>
            
            <table id="standard_name_table" border="1" width="100%" cellpadding="2" cellspacing="0">
                <th width="76%">Standard Name</th>
                <th width="8%">Canonical Units</th>
                <th width="8%">AMIP</th>
                <th width="8%">GRIB</th>
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
                <xsl:variable name="standard_name_id" select="@id"/>
                <xsl:apply-templates select="../alias[entry_id=$standard_name_id]"/>
                
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
            <td><xsl:value-of select="canonical_units"/></td>
            <td>
                <xsl:choose>
                    <xsl:when test="amip">
                        <xsl:value-of select="amip"/>
                    </xsl:when>
                    <xsl:otherwise>
                        &#160;
                    </xsl:otherwise>
                </xsl:choose>
            </td>
            <td>
                <xsl:choose>
                    <xsl:when test="grib">
                        <xsl:value-of select="grib"/>
                    </xsl:when>
                    <xsl:otherwise>
                        &#160;
                    </xsl:otherwise>
                </xsl:choose>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="alias">
        <div style="padding-left: 16px;"><i>alias:</i>&#160;<xsl:value-of select="@id"/></div>
    </xsl:template>

    <xsl:template name="FormatDate">
      <xsl:param name="DateTime" />
      <!-- new date format 24 March 2011 -->
      <xsl:variable name="year">
        <xsl:value-of select="substring($DateTime,1,4)" />
      </xsl:variable>
      <xsl:variable name="mon-temp">
        <xsl:value-of select="substring-after($DateTime,'-')" />
      </xsl:variable>
      <xsl:variable name="mon">
       <xsl:value-of select="substring-before($mon-temp,'-')" />
      </xsl:variable>
      <xsl:variable name="day-temp">
        <xsl:value-of select="substring-after($mon-temp,'-')" />
      </xsl:variable>
      <xsl:variable name="day">
        <xsl:value-of select="substring($day-temp,1,2)" />
      </xsl:variable>
      <xsl:value-of select="$day"/>
      <xsl:value-of select="' '"/>
      <xsl:choose>
        <xsl:when test="$mon = '01'">January</xsl:when>
        <xsl:when test="$mon = '02'">February</xsl:when>
        <xsl:when test="$mon = '03'">March</xsl:when>
        <xsl:when test="$mon = '04'">April</xsl:when>
        <xsl:when test="$mon = '05'">May</xsl:when>
        <xsl:when test="$mon = '06'">June</xsl:when>
        <xsl:when test="$mon = '07'">July</xsl:when>
        <xsl:when test="$mon = '08'">August</xsl:when>
        <xsl:when test="$mon = '09'">September</xsl:when>
        <xsl:when test="$mon = '10'">October</xsl:when>
        <xsl:when test="$mon = '11'">November</xsl:when>
        <xsl:when test="$mon = '12'">December</xsl:when>
      </xsl:choose>
      <xsl:value-of select="' '"/>
      <xsl:value-of select="$year"/>
    </xsl:template>
    
</xsl:stylesheet>
