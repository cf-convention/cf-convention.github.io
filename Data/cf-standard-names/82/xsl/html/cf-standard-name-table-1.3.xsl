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
        <script type="text/javascript"><![CDATA[
        ALIAS_FLAG = "\n<i>alias:</i>"
        UNITS_CLASS = "canonical_units"

        /**
         * Apply a filter hides all standard names not matching `filter_text`.
         *
         * If `filter_text` contains no spaces, it is treated as a regexp.
         * Otherwise, all substrings must occur somewhere.
         */
        function applyFilter(filter_text) {
            var search_type = 'regexp';
            var num_matches = 0;
            var must_search_help_text = document.getElementById('must_search_help_text').checked;
            var must_search_aliases = document.getElementById('must_search_aliases').checked;
            var must_search_units_only = document.getElementById('must_search_units_only').checked;
            var is_boolean_and = document.getElementById('logical_operator_and').checked;
            var filter_text_re = new RegExp(filter_text, 'i')
            // case sensitive regex for units
            var units_regex = new RegExp(filter_text) 
            if (filter_text.indexOf(' ') == -1 || must_search_units_only) {
                search_type = 'regexp';
            }
            else {
                search_type = 'string';
                var string_parts = filter_text.split(' ');
            }
            allRows = document.getElementById('standard_name_table')
                              .getElementsByTagName('tr');
            for (var i = 0; i < allRows.length; i++) {
                currentRow = allRows[i];
                currentStandardName = currentRow.id.substring(0, currentRow.id.length - 3)
                if (currentRow.id != '') {
                    is_match = _isRowMatchingQuery(
                        search_type,
                        must_search_units_only,
                        must_search_help_text,
                        currentStandardName,
                        currentRow,
                        string_parts,
                        filter_text_re,
                        units_regex,
                        is_boolean_and
                    )
                    if (is_match) {
                        num_matches++;
                        currentRow.style.display = '';
                        if (must_search_help_text) {
                            showHelp(currentStandardName);
                        }
                        else {
                            hideHelp(currentStandardName);
                        }
                    }
                    else {
                        currentRow.style.display = 'none';
                    }
                }
            }
            var filter_matches = document.getElementById('filter_matches');
            var filter_matches_num = document.getElementById('filter_matches_num');
            var filter_matches_query = document.getElementById('filter_matches_query');
            if (filter_text != '') {
                filter_matches.style.visibility = 'visible';
                filter_matches_num.innerHTML = num_matches;
                filter_matches_query.innerHTML = filter_text;
            }
            else {
                filter_matches.style.visibility = 'hidden';
            }
        }

        function clearFilter() {
            curTable = document.getElementById('standard_name_table');
            allRows = curTable.getElementsByTagName('tr');

            for (var i = 0; i < allRows.length; i++) {
                currentRow = allRows[i];
                currentRow.style.display = '';
            }

            var filter_matches = document.getElementById('filter_matches');
            filter_matches.style.visibility = 'hidden';

            document.getElementById('filter_text').value = '';
        }

        function filterConstraints($checkboxElem){
            var must_search_units_only = $checkboxElem.checked;
            if (must_search_units_only){
                document.getElementById('must_search_help_text').checked = false;
                document.getElementById('must_search_help_text').disabled = true;
                document.getElementById('must_search_aliases').checked = false;
                document.getElementById('must_search_aliases').disabled = true;
                document.getElementById('logical_operator_and').checked = false;
                document.getElementById('logical_operator_and').disabled = true;
                document.getElementById('logical_operator_or').checked = false;
                document.getElementById('logical_operator_or').disabled = true;
            } else {
                document.getElementById('must_search_help_text').disabled = false;
                document.getElementById('must_search_aliases').disabled = false;
                document.getElementById('logical_operator_and').checked = true;
                document.getElementById('logical_operator_and').disabled = false;
                document.getElementById('logical_operator_or').disabled = false;
            }
        }


        function toggleHelp(standard_name) {
            // check for the existence of the help tr object for this standard_name
            var helpDiv = document.getElementById(standard_name + '_help');

            if (helpDiv) {
                if (helpDiv.style.display != 'none') {
                    helpDiv.style.display = 'none';

                    curArrow = document.getElementById(standard_name + '_arrow');
                    curArrow.src = '../build/media/images/arrow_right.gif';
                }
                else {
                    helpDiv.style.display = '';

                    curArrow = document.getElementById(standard_name + '_arrow');
                    curArrow.src = '../build/media/images/arrow_down.gif';
                }
            }
        }

        function showHelp(standard_name) {
            var helpDiv = document.getElementById(standard_name + '_help');

            if (helpDiv) {
                helpDiv.style.display = '';
                curArrow = document.getElementById(standard_name + '_arrow');
                curArrow.src = '../build/media/images/arrow_down.gif';
            }
        }

        function hideHelp(standard_name) {
            var helpDiv = document.getElementById(standard_name + '_help');

            if (helpDiv) {
                helpDiv.style.display = 'none';
                curArrow = document.getElementById(standard_name + '_arrow');
                curArrow.src = '../build/media/images/arrow_right.gif';
            }
        }

        function toggleSearchHelp($event) {
            var helpbox = document.getElementById("search-help");
            var arrow = document.getElementById("search-help-arrow");
            if (helpbox.style.display === 'none') {
                helpbox.style.display = 'inline-block';
                arrow.src = '../build/media/images/arrow_down.gif';
            }
            else {
                helpbox.style.display = 'none';
                arrow.src = '../build/media/images/arrow_right.gif';
            }
        }

        function _isTextInAliases(aliases, regex) {
            return aliases.filter((alias) => alias.match(regex)).length > 0
        }

        function _isTextInUnitsText(units, regex) {
            return units && units.match(regex)
        }

        function _readAliases(tr) {
            return _getAliasesDivs(tr).map(_readAlias)
        }

        function _getAliasesDivs(tr) {
            return Array.from(tr.querySelectorAll('div'))
                .filter(el => el.innerHTML.includes(ALIAS_FLAG));
        }

        function _readAlias(div) {
            return div.innerHTML.substring(ALIAS_FLAG.length)
        }

        function _read_units(div) {
            units = div.querySelector("." + UNITS_CLASS)
            if (units) return units.innerHTML
            else return null
        }

        function _isRowMatchingQuery(
                search_type,
                must_search_units_only,
                must_search_help_text,
                standardName,
                row,
                string_parts,
                filter_text_re,
                units_regex,
                is_boolean_and
        ) {
            aliases = _readAliases(row)
            units = _read_units(row)
            if (search_type == 'regexp') {
                if (must_search_units_only) {
                    return _isTextInUnitsText(units, units_regex);
                }
                is_match = standardName.match(filter_text_re);
                if (must_search_help_text) {
                    var helpText = document.getElementById(standardName + '_help').innerHTML;
                    is_match = is_match || helpText.match(filter_text_re);
                }
                if (must_search_aliases) {
                    is_match = is_match || _isTextInAliases(aliases, filter_text_re);
                }
                return is_match
            }
            if (is_boolean_and) {
                var is_match = true;
                for (var j = 0; j < string_parts.length && is_match; j++) {
                    re = new RegExp(string_parts[j], 'i')
                    if (!standardName.match(re)) {
                        is_match = false;
                    }
                    if (must_search_aliases) {
                        is_match = is_match || _isTextInAliases(aliases, re);
                    }
                }
            }
            else {
                var is_match = false;
                for (var j = 0; j < string_parts.length && !is_match; j++) {
                    re = new RegExp(string_parts[j], 'i')
                    if (standardName.match(re)) {
                        is_match = true;
                    }
                    if (must_search_aliases) {
                        is_match = is_match || _isTextInAliases(aliases, re);
                    }
                }
            }
            if (must_search_help_text) {
                var helpText = document.getElementById(standardName + '_help').innerHTML;
                if (is_boolean_and) {
                    var is_help_match = true;
                    for (var j = 0; j < string_parts.length && is_help_match; j++) {
                        if (!helpText.match(new RegExp(string_parts[j], 'i'))) {
                            is_help_match = false;
                        }
                    }
                }
                else {
                    var is_help_match = false;
                    for (var j = 0; j < string_parts.length && !is_help_match; j++) {
                        if (helpText.match(new RegExp(string_parts[j], 'i'))) {
                            is_help_match = true;
                        }
                    }
                }
                is_match = is_match || is_help_match;
            }
            return is_match
        }

]]> 
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
                                    <label><input id="must_search_help_text" 
                                                  name="must_search_help_text" 
                                                  type="checkbox"/> Also search help text</label>
                                    <br/>
                                    <label><input id="must_search_aliases"
                                                  name="must_search_aliases"
                                                  type="checkbox" checked="checked"/> Also search aliases text</label>
                                    <br/>
                                    <label><input id="must_search_units_only"
                                                  name="must_search_units_only"
                                                  type="checkbox" onchange="filterConstraints(this)" />Only search canonical units</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div onclick="toggleSearchHelp(event)">
                                        <img id="search-help-arrow" src="../build/media/images/arrow_down.gif"></img>
                                        <label>Advanced searches</label>
                                    </div>
                                    <div id="search-help"
                                        style="display: inline-block; padding-left: 16px; margin-top: 4px; border: 1px dashed aliceblue;">                                   
                                        To look for standard names you can use either:
                                        <ul>
                                        <li>
                                            An extended regular expression. This is a powerful tool used to search complex queries.
                                            <br/>For example, with the "Only search canonical units" enabled, <code>^mol m-3$|^mol/m3$</code> would match any string that is exactly "mol m-3" or exactly "mol/m3".
                                            Exact matches (that is, matches to the entire string) are toggled using the <code>^</code> prefix and the <code>$</code> suffix. The <code>|</code> character acts as an "or" operator.<br/>
                                            If you want to learn more, <a href="https://regexr.com/">Regexr</a> is a great playground to explore regular expressions.
                                        </li>
                                        <li>
                                            A list of possible matches separated by blank spaces.
                                            <br/>This is used in conjunction  with AND and OR radio buttons.
                                            For example, the query "age ice", with AND enabled, would search for every standard names where that contains both "age" and "ice".
                                            <br/>It is equivalent to the regular expression <code>(?=.*?ice)(?=.*?age).+</code>
                                        </li>
                                        </ul>
                                    </div>
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
            <td class="canonical_units"><xsl:value-of select="canonical_units"/></td>
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
