---
layout: default
title: Vocabularies
group: "navigation"
---
# CF Standard Names and other CF Controlled Vocabularies
## Standard Name Table
  
### Quick links to current version
[HTML](Data/cf-standard-names/current/build/cf-standard-name-table.html) &nbsp;
[XML](Data/cf-standard-names/current/src/cf-standard-name-table.xml) &nbsp;
[KWIC_Index](Data/cf-standard-names/current/build/kwic_index_for_cf_standard_names.html) &nbsp;

### HTML versions (most current first)
N.B. For technical reasons, no standard name table was published with version number 38
{% assign parent_path = "/Data/cf-standard-names/" %}
{% assign file_name = "cf-standard-name-table.html" %}
{% assign tables = site.static_files | where: "name", file_name | reverse | uniq %}
{% assign current = tables.first.path | remove_first: parent_path  | split: "/" | first %}

&nbsp;
{%- for file in tables %}
  {%- assign version = file.path | remove_first: parent_path | split: "/" | first | to_integer %}
  {%- if version >=10 -%}
    [v{{ version }}]({{ parent_path }}{{ version }}/build/{{ file_name }}) &nbsp; 
  {%- endif %}
{%- endfor %}
{%- for file in tables %}
  {%- assign version = file.path | remove_first: parent_path | split: "/" | first | to_integer %}
  {%- if version <10 and version > 0-%}
    [v{{ version }}]({{ parent_path }}{{ version }}/build/{{ file_name }}) &nbsp; 
  {%- endif %}
{%- endfor %}

### XML versions (most current first)
N.B. For technical reasons, no standard name table was published with version number 38
{% assign parent_path = "/Data/cf-standard-names/" %}
{% assign file_name = "cf-standard-name-table.xml" %}
{% assign tables = site.static_files | where: "name", file_name | reverse | uniq %}
{% assign current = tables.first.path | remove_first: parent_path  | split: "/" | first %}

&nbsp;
{%- for file in tables %}
  {%- assign version = file.path | remove_first: parent_path | split: "/" | first | to_integer %}
  {%- if version >=10 -%}
    [v{{ version }}]({{ parent_path }}{{ version }}/src/{{ file_name }}) &nbsp; 
  {%- endif %}
{%- endfor %}
{%- for file in tables %}
  {%- assign version = file.path | remove_first: parent_path | split: "/" | first | to_integer %}
  {%- if version <10 and version > 0-%}
    [v{{ version }}]({{ parent_path }}{{ version }}/src/{{ file_name }}) &nbsp; 
  {%- endif %}
{%- endfor %}

### Keyword Centred List (most current first)
{% assign parent_path = "/Data/cf-standard-names/" %}
{% assign file_name = "kwic_index_for_cf_standard_names.html" %}
{% assign tables = site.static_files | where: "name", file_name | reverse | uniq %}
{% assign current = tables.first.path | remove_first: parent_path  | split: "/" | first %}

&nbsp;
{%- for file in tables %}
  {%- assign version = file.path | remove_first: parent_path | split: "/" | first | to_integer %}
  {%- if version >=10 -%}
    [v{{ version }}]({{ parent_path }}{{ version }}/build/{{ file_name }}) &nbsp; 
  {%- endif %}
{%- endfor %}
{%- for file in tables %}
  {%- assign version = file.path | remove_first: parent_path | split: "/" | first | to_integer %}
  {%- if version <10 and version > 0-%}
    [v{{ version }}]({{ parent_path }}{{ version }}/build/{{ file_name }}) &nbsp; 
  {%- endif %}
{%- endfor %}

### Documents
- [Guidelines](Data/cf-standard-names/docs/guidelines.html) for Construction of CF Standard Names
- List of [contributors](Data/cf-standard-names/docs/standard-name-contributors.html) to CF Standard Names<br>
- [Rules](standard_name_rules.md) for making changes to the CF vocabularies
- [Schema file](Data/schema-files/cf-standard-name-table-2.0.xsd) for all versions of the Standard Name Table XML files

### Discussion
- Current issues in the [CF `discuss` repo](https://github.com/cf-convention/discuss/issues), where proposals for additions and changes to standard names are made.
- Current proposals for new standard names in the [CEDA vocabulary editor](https://cfeditor.ceda.ac.uk/proposals/1);
click "Inactive" to see resolved proposals (from March 2011 onwards) i.e. those which have been either accepted and included in the standard name table or rejected.

## Area Type Table (v11, 06 July 2023)
[HTML](Data/area-type-table/current/build/area-type-table.html) &nbsp;
[XML](Data/area-type-table/current/src/area-type-table.xml) &nbsp;

### Previous Versions (HTML)
{% assign parent_path = "/Data/area-type-table/" %}
{% assign file_name = "area-type-table.html" %}
{% assign tables = site.static_files | where: "name", file_name | reverse | uniq %}
{% assign current = tables.first.path | remove_first: parent_path  | split: "/" | first %}

&nbsp;
{%- for file in tables %}
  {%- assign version = file.path | remove_first: parent_path  | split: "/" | first | to_integer %}
  {%- if version >= 10 -%}
    [v{{ version }}]({{ parent_path }}{{ version }}/build/{{ file_name }}) &nbsp;
  {%- endif %}
{%- endfor %}
{%- for file in tables %}
  {%- assign version = file.path | remove_first: parent_path  | split: "/" | first | to_integer %}
  {%- if version < 10 and version > 0 -%}
    [v{{ version }}]({{ parent_path }}{{ version }}/build/{{ file_name }}) &nbsp;
  {%- endif %}
{%- endfor %}

## Standardized Region List (v4, 18 December 2018)
[HTML](Data/standardized-region-list/standardized-region-list.html) &nbsp;
[XML](Data/standardized-region-list/standardized-region-list.xml) &nbsp;
Old Format [HTML](Data/cf-standard-names/docs/standardized-region-names.html) &nbsp;

### Previous Versions (HTML)
{% assign parent_path = "Data/standardized-region-list/" %}
{% assign versions = "3, 2, 1" | split:"," %}
{% for version in versions -%}
[{{ version }}]({{ parent_path }}standardized-region-list.{{ version }}.html) &nbsp;
{% endfor -%}

### Previous Versions (XML)
{% for version in versions -%}
[{{ version }}]({{ parent_path }}standardized-region-list.{{ version }}.xml) &nbsp;
{% endfor -%}
