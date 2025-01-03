---
layout: default
title: CF Conventions Home Page
flash_message: "The CF Conventions have won the <a href='https://www.agu.org/user-profile?cstkey=0fc4a399-6049-4787-8dc4-c57c91b8a26f' target='_blank'>AGU Open Science Recognition Prize</a> for 2024! 🎉"
flash_message_type: "success"  # Optional: Use 'info', 'success', 'warning', or 'error'
# hero_image: Data/media/images/CF2024_group1.JPG
hero_header: CF Metadata Conventions # Only displays if hero_image is provided
# hero_paragraph: Some words about the CF Conventions # Only displays if hero_image is provided
hero_button_text: View latest release # Only displays if hero_image is provided
hero_button_url: Data/cf-conventions/cf-conventions-1.12/cf-conventions.html # Only displays if hero_image is provided
---

# CF Metadata Conventions

The CF metadata conventions are designed to promote the processing and sharing of files created with the [NetCDF API][api].
The conventions define metadata that provide a definitive description of what the data in each variable represents, and the spatial and temporal properties of the data.
This enables users of data from different sources to decide which quantities are comparable, and facilitates building applications with powerful extraction, regridding, and display capabilities.
The CF convention includes a standard name table, which defines strings that identify physical quantities.

---

[**_Ask a question_ &#x2753; about how to use CF**][github_askq]<br>
**_Read the conventions_:** **Latest release** (1.12) [HTML][releasedhtml] [PDF][releasedpdf]&nbsp;&bull;&nbsp;
**Working draft** [HTML][workinghtml] [PDF][workingpdf]<br>
**_Check the latest vocabularies_:** [**Standard names**][currentnames]&nbsp;&bull;&nbsp;
[**Area types**][areatypes]&nbsp;&bull;&nbsp;
[**Standardized regions**][regions]

---

CF is developed through open discussion on GitHub.
If you would like to propose a change, make a suggestion, report a problem or ask a question, please [see here][discussion].
Changes are decided according to the CF [governance arrangements][governance].
The CF community embraces a philosophy of producing excellence by maintaining an open and welcoming culture and an environment that promotes debate and inquiry in a respectful, bold and intellectually rigorous fashion.

Initially CF was developed for gridded data from climate and forecast models (hence "CF") of the atmosphere and ocean, but its use has subsequently extended to other geosciences, and to observations as well as numerical models.
The use of CF is recommended where applicable by Unidata.

## Quick links

See also the links in the navigation bar at the top of this page.

* [CF GitHub Discussions][github_discussions]: announcements, forum for community discussion, questions and answers
* Current proposals for changing CF (CF GitHub issues): [vocabulary][github_vocabularies] (including standard names), [conventions][github_conventions], this [website][github_website] (including governance)
* [CF GitHub organisation][cf_github]
* [CF FAQ][faq]
* [List of software for working with CF](software.md)
* [List of Projects and Activities that Use the CF Metadata Conventions](projects-activities.md)
* [Paper][cfdmpaper] describing the CF data model and reference software
* Overview of CF basics as a [presentation][viewgraphs] and [paper][article]

[api]: https://www.unidata.ucar.edu/software/netcdf/index.html
[coards]: https://ferret.pmel.noaa.gov/noaa_coop/coop_cdf_profile.html
[viewgraphs]: Data/cf-documents/overview/viewgraphs.pdf
[article]: Data/cf-documents/overview/article.pdf
[discussion]: discussion.md
[governance]: governance.md
[faq]: faq.md
[releasedhtml]: Data/cf-conventions/cf-conventions-1.12/cf-conventions.html
[releasedpdf]: Data/cf-conventions/cf-conventions-1.12/cf-conventions.pdf
[workinghtml]: /cf-conventions/cf-conventions.html
[workingpdf]: /cf-conventions/cf-conventions.pdf
[currentnames]: Data/cf-standard-names/current/build/cf-standard-name-table.html
[areatypes]: Data/area-type-table/current/build/area-type-table.html
[regions]: Data/standardized-region-list/standardized-region-list.current.html
[cfdmpaper]: https://doi.org/10.5194/gmd-10-4619-2017
[github_conventions]: https://github.com/cf-convention/cf-conventions/issues
[github_discuss]: https://github.com/cf-convention/discuss/issues
[github_vocabularies]: https://github.com/cf-convention/vocabularies/issues
[github_website]: https://github.com/cf-convention/cf-convention.github.io/issues
[cf_github]: https://github.com/cf-convention
[github_discussions]: https://github.com/orgs/cf-convention/discussions
[github_askq]: https://github.com/orgs/cf-convention/discussions/new?category=q-a-about-using-cf
