---
layout: default
title: Software that "Understands" CF Data
---

# Software that "Understands" CF Data
This page lists sofware packages that "understand" CF Data.
If you have any additions or corrections for this page,
please submit an issue on the [CF Website GitHub repo][website-repo]
(see the [Contributing Guide][website-contrib] for more details).

For a software package to be listed on this page, it must ....
The description of each software package should give some indication
of the level of support for CF.

[website-repo]: https://github.com/cf-convention/cf-convention.github.io
[website-contrib]: https://github.com/cf-convention/cf-convention.github.io/blob/master/CONTRIBUTING.md

## CF Compliance Checkers

### cf-checker - Python Tool for Compliance Checking
The [cf-checker](https://github.com/cedadev/cf-checker) is a python tool to check compliance of netCDF files against the CF Convention.
It can be run as a command-line tool, via a web interface (available at [NCAS](https://github.com/cedadev/cf-checker)
and [CEDA](http://wps-web1.ceda.ac.uk/submit/form?proc_id=CFChecker)) or imported as a python library.
The cf-checker verifies conformance according to the requirements and recommendations laid out in the
[CF Conformance Document](https://cfconventions.org/cf-conventions/conformance.html).
It is possible to check conformance against any CF version.

### IOOS Compliance Checker
The [IOOS Compliance Checker](https://github.com/ioos/compliance-checker)
is a python based tool for data providers to check for completeness
and community standard compliance of local or remote netCDF files against CF,
[ACDD](http://wiki.esipfed.org/index.php/Attribute_Convention_for_Data_Discovery_1-3),
and [IOOS Metadata Profile](https://ioos.github.io/ioos-metadata) file standards.
The Compliance Checker can be used as a command-line tool or as a library
that can be integrated into other software.

The Compliance Checker also includes a [web-based version](https://data.ioos.us/compliance/index.html)
that enables a broader audience and improve accessibility for the checker.
With the web version, providers can simply provide a link or upload their datasets
and get the full suite of capabilities that Compliance Checker offers.

## Free and Open Source Software Packages

### cfdm - Python CF Data Model Package
The [cfdm Python package](https://ncas-cms.github.io/cfdm) implements
the [CF data model](https://doi.org/10.5194/gmd-10-4619-2017)
for its internal data structures and so is able to process any CF-compliant dataset.
It is not strict about CF-compliance, however, so that partially conformant datasets
may be ingested from existing datasets and written to new datasets.
This is so that datasets which are partially conformant may nonetheless be modified in memory.

### cf-python - CF Python Package
The [Python cf package, "cf-python"](https://ncas-cms.github.io/cf-python/),
is an Earth Science data analysis library.
It is built on [cfdm](#cfdm---python-cf-data-model-package) and implements the CF data model
for its internal data structures so is able to process any CF-compliant dataset.
It can read, write and inspect field constructs and manipulate the data and metadata therein
by means of statistical operations, collapsing, subspacing, regridding and more.
Field constructs from cf can also be visualised with the [cf-plot package](#cf-plot---cf-python-plotting-package).

### cf-plot - CF Python Plotting package
cf-plot is a set of Python functions for making common contour, vector
and line plots that climate researchers use.
cf-plot generally uses [cf-python](#cf-python---cf-python-package)
to present the data and CF attributes for plotting.
It can also use numpy arrays of data as the input fields
making for flexible plotting of data.
cf-plot uses the Python numpy, matplotlib and scipy libraries.

### Iris - Python library for analysing and visualising Earth science data
[Iris](https://scitools.org.uk/iris/docs/latest/) implements a data model based on the CF conventions
giving you a powerful, format-agnostic interface for working with your data.
It excels when working with multi-dimensional Earth Science data,
where tabular representations become unwieldy and inefficient.

CF Standard names, units, and coordinate metadata are built into Iris,
giving you a rich and expressive interface for maintaining an accurate representation of your data.

### netCDF Operators (NCO)
The [netCDF Operators](https://nco.sf.net) toolkit manipulates and analyzes data stored in netCDF-accessible formats, including DAP, HDF4, HDF5, and, most recently, Zarr. NCO exploits the geophysical expressivity and logic of many CF (Climate & Forecast) metadata conventions including support for UDUNITS, fo the attributes `Conventions`, `history`, `scale_factor`, `add_offset`, `coordinates`, `cell_methods`, and `cell_measures`, for hierarchical datasets, and for auxiliary coordinates. See the [documentation](https://nco.sf.net/nco.html) for a full description.


### netCDF Flattener - Flatten netCDF files
The [netCDF Flattener](https://gitlab.eumetsat.int/open-source/netcdf-flattener/) Python package takes netCDF objects that use groups and flattens them
while preserving references as described in the [Groups section](http://cfconventions.org/Data/cf-conventions/cf-conventions-1.10/cf-conventions.html#groups)
of the CF Conventions.
The resulting object is logically equivalent to the original, and can be processed by software that isn't able to work with files that use netCDF-4 groups.

### netCDF-Java Library
The [netCDF Java library](https://www.unidata.ucar.edu/software/netcdf-java/) provides an interface for scientific data access.
It can be used to read scientific data from a variety of file formats including netCDF, HDF, GRIB, BUFR, and many others, as well as a variety of remote data access protocols.
It implements the [Unidata Common Data Model](https://docs.unidata.ucar.edu/netcdf-java/current/userguide/common_data_model_overview.html)
which uses CF and other metadata convention in its Coordinate System and Scientific Feature Type layers.
NetCDF-Java can write netCDF-3/4 files that conform to the CF Metadata Conventions.

### THREDDS Data Server (TDS)
The [THREDDS Data Server (TDS)](https://www.unidata.ucar.edu/software/tds/) is a web server that provides metadata and data access for scientific datasets,
using OPeNDAP, OGC WMS and WCS, HTTP, and other remote data access protocols.
It is also capable of mapping CF metadata to ISO-19115 though the use of ncISO.
The TDS can use the NetCDF Markup Language (NcML) to modify datasets in-memory to aid in CF conformance without the need to rewrite the files as stored on disk.
The NetCDF Subset Service allows users to subset CF compliant datasets in coordinate space using a REST API.
The service returns subsets as CF compliant netCDF-3/4 files, in addition to other formats.

### xarray - Python Package for working with n-D labeled arrays
[Xarray](http://xarray.pydata.org/) is a python package designed for working with
labelled, multi-dimensional array data, built around the netCDF data model.
It uses CF conventions in several ways, such as encoding / decoding variables
and interpreting metadata for visualization.

## Commercial Software Packages
