---
layout: default
title: CF Conventions Home Page
---

# CF Metadata Conventions

The CF metadata conventions are designed to promote the processing and sharing of files created with the [NetCDF API][api]. 
The conventions define metadata that provide a definitive description of what the data in each variable represents, and the spatial and temporal properties of the data. 
This enables users of data from different sources to decide which quantities are comparable, and facilitates building applications with powerful extraction, regridding, and display capabilities.
The CF convention includes a standard name table, which defines strings that identify physical quantities.

---

**Latest release** (1.8) [HTML][releasedhtml] [PDF][releasedpdf]
<code>&nbsp;&bull;&nbsp;</code>
**Working draft** [HTML][workinghtml] [PDF][workingpdf]
<code>&nbsp;&bull;&nbsp;</code>
[**Standard name table**][currentnames]

---

CF is developed through open discussion on GitHub. If you would like to propose a change, make a suggestion, report a problem or ask a question, please [see here](cfconventions.org/discussion.html). Changes are decided according to the CF [governance arrangements](cfconventions.org/governance.html). The CF community embraces a philosophy of producing excellence by maintaining an open and welcoming culture and an environment that promotes debate and inquiry in a respectful, bold and intellectually rigorous fashion. 

Initially CF was developed for gridded data from climate and forecast models (hence "CF") of the atmosphere and ocean, but its use has subsequently extended to other geosciences, and to observations as well as numerical models. The use of CF is recommended where applicable by Unidata.

## Quick links

See also the links in the navigation bar at the top of this page.

* [Latest release of CF conventions][releasedhtml]
* [Current version of CF standard name table][currentnames]
* Current issues: [general discussion][github_discuss] (including standard names), [conventions][github_conventions], this [website][github_website] (including governance)
* [CF FAQ][q8]
* [List of software for working with CF](software.md)
* [Paper][cfdmpaper] describing the CF data model and reference software
* Overview of CF basics as a [presentation][viewgraphs] and [paper][article]


[api]: https://www.unidata.ucar.edu/software/netcdf/index.html
[coards]: https://ferret.pmel.noaa.gov/noaa_coop/coop_cdf_profile.html
[viewgraphs]: Data/cf-documents/overview/viewgraphs.pdf
[article]: Data/cf-documents/overview/article.pdf
[discussion]: http://cf-convention.github.io/discussion.html
[q1]: latest.html
[q2]: standard-names.html
[q3]: http://cf-trac.llnl.gov/trac
[q4]: http://www.met.reading.ac.uk/~david/cf_trac_summary.html
[q5]: http://mailman.cgd.ucar.edu/pipermail/cf-metadata/
[q6]: requirements-and-recommendations.html
[q7]: compliance-checker.html
[q8]: faq.html
[releasedhtml]: Data/cf-conventions/cf-conventions-1.8/cf-conventions.html
[releasedpdf]: Data/cf-conventions/cf-conventions-1.8/cf-conventions.html
[workinghtml]: Data/cf-conventions/cf-conventions.html
[workingpdf]: Data/cf-conventions/cf-conventions.pdf
[currentnames]: cf-standard-names/current/build/cf-standard-name-table.html
[cfdmpaper]: https://doi.org/10.5194/gmd-10-4619-2017
[github_discuss]: https://github.com/cf-convention/discuss/issues
[github_conventions]: https://github.com/cf-convention/cf-conventions/issues
[github_website]: https://github.com/cf-convention/cf-convention.github.io/issues
