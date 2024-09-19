---
layout: default
title: Software that "Understands" CF Data
---

# Software that "Understands" CF Data

This page lists software packages that "understand" CF Data.
If you have any additions or corrections for this page, please submit an issue on the [CF Website GitHub repo][website-repo] (see the [Contributing Guide][website-contrib] for more details).

The description of each software package should give some indication of the level of support for CF.

[website-repo]: https://github.com/cf-convention/cf-convention.github.io
[website-contrib]: https://github.com/cf-convention/cf-convention.github.io/blob/master/CONTRIBUTING.md

## CF Compliance Checkers

### cf-checker - Python Tool for Compliance Checking

The cf-checker is a python tool to check compliance of netCDF files against the CF Conventions.
It can be run via a [web interface](https://cfchecker.ncas.ac.uk) or [downloaded](https://github.com/cedadev/cf-checker) for use as a command-line utility on Linux and macOS by installing from PyPI, conda-forge or source code.
The cf-checker verifies conformance according to the requirements and recommendations laid out in the [CF Conformance Document](https://cfconventions.org/cf-conventions/conformance.html).
It is possible to check conformance against any CF version.

### IOOS Compliance Checker

The [IOOS Compliance Checker](https://github.com/ioos/compliance-checker) is a python based tool for data providers to check for completeness and community standard compliance of local or remote netCDF files against CF, [ACDD](http://wiki.esipfed.org/index.php/Attribute_Convention_for_Data_Discovery_1-3), and [IOOS Metadata Profile](https://ioos.github.io/ioos-metadata) file standards.
The Compliance Checker can be used as a command-line tool or as a library that can be integrated into other software.

The Compliance Checker also includes a [web-based version](https://data.ioos.us/compliance/index.html) that enables a broader audience and improve accessibility for the checker.
With the web version, providers can simply provide a link or upload their datasets and get the full suite of capabilities that Compliance Checker offers.

## Free and Open Source Software Packages

### CDO - Climate Data Operators

[CDO](https://code.mpimet.mpg.de/projects/cdo) is a collection of command line operators to manipulate and analyse climate and NWP model data.
It supports GRIB, netCDF, SERVICE, EXTRA and IEG data formats with more than 600 operators available.
Many of the [operators](https://code.mpimet.mpg.de/projects/cdo/embedded/index.html) rely on the CF conventions to interpret file contents (e.g. grid projections, axis direction, etc.).
CF-compliant output can be produced, especially via the `cmor` and `cmorlite` operators.

### cfdm - Python CF Data Model Package

The [cfdm Python package](https://ncas-cms.github.io/cfdm) implements the [CF data model](https://doi.org/10.5194/gmd-10-4619-2017) for its internal data structures and so is able to process any CF-compliant dataset.
It is not strict about CF-compliance, however, so that partially conformant datasets may be ingested from existing datasets and written to new datasets.
This is so that datasets which are partially conformant may nonetheless be modified in memory.

### cf-python - CF Python Package

The [Python cf package, "cf-python"](https://ncas-cms.github.io/cf-python/), is an Earth Science data analysis library.
It is built on [cfdm](#cfdm---python-cf-data-model-package) and implements the CF data model for its internal data structures so is able to process any CF-compliant dataset.
It can read, write and inspect field constructs and manipulate the data and metadata therein by means of statistical operations, collapsing, subspacing, regridding and more.
Field constructs from cf can also be visualised with the [cf-plot package](#cf-plot---cf-python-plotting-package).

### cf-plot - CF Python Plotting package

The [cf-plot Python package](https://ncas-cms.github.io/cf-plot/build/) supports the production and customization of publication-quality contour, vector, line and more plots using matplotlib, Cartopy and [cf-python](#cf-python---cf-python-package), in as few lines of code as possible.

### cf-view - CF Python Exploration and Visualization Package

The [cf-view Python package](https://ncas-cms.github.io/cf-view/build/) is a Graphical User Interface (GUI) for earth science and aligned research which supports the exploration, analysis and plotting of netCDF and Met Office format (PP or fields) data. It uses the [cf-python](#cf-python---cf-python-package) and [cf-plot](#cf-plot---cf-plot-package) packages.

### ERDDAP - scientific data server

[ERDDAP](https://github.com/BobSimons/erddap) is a scientific data server that gives users a simple, consistent way to download subsets of gridded and tabular scientific datasets in common file formats and make graphs and maps.
ERDDAP is a Free and Open Source (Apache and Apache-like) Java Servlet from NOAA NMFS SWFSC Environmental Research Division (ERD).

### Ferret and pyFerret - analysis and visualization for ocean and weather data

[Ferret](https://ferret.pmel.noaa.gov/Ferret/) is an interactive computer visualization and analysis environment designed to meet the needs of oceanographers and meteorologists analyzing large and complex gridded data sets.
It runs on recent Unix and Mac systems, using X windows for display.
[PyFerret](https://ferret.pmel.noaa.gov/Ferret/documentation/pyferret), introduced in 2012, is a Python module wrapping Ferret.
PyFerret is an upgrade to Ferret which runs existing Ferret scripts and includes all Ferret functionality with updated graphics capabilities and additional analysis functions.
In addition the pyferret module provides Python functions so Python users can easily take advantage of Ferret's abilities to retrieve, manipulate, visualize, and save data.

### Iris - Python library for analysing and visualising Earth science data

[Iris](https://scitools.org.uk/iris/docs/latest/) implements a data model based on the CF Conventions giving you a powerful, format-agnostic interface for working with your data.
It excels when working with multi-dimensional Earth Science data, where tabular representations become unwieldy and inefficient.

CF Standard names, units, and coordinate metadata are built into Iris, giving you a rich and expressive interface for maintaining an accurate representation of your data.

### netCDF Operators (NCO)

The [netCDF Operators](https://nco.sourceforge.net/) toolkit manipulates and analyzes data stored in netCDF-accessible formats, including DAP, HDF4, HDF5, and, most recently, Zarr.
NCO exploits the geophysical expressivity and logic of many CF (Climate & Forecast) metadata conventions including support for UDUNITS, for the attributes `Conventions`, `history`, `scale_factor`, `add_offset`, `coordinates`, `cell_methods`, and `cell_measures`, for hierarchical datasets, and for auxiliary coordinates.
See the [documentation](https://nco.sourceforge.net/nco.html) for a full description.

### netCDF Flattener - Flatten netCDF files

The [netCDF Flattener](https://gitlab.eumetsat.int/open-source/netcdf-flattener/) Python package takes netCDF objects that use groups and flattens them while preserving references as described in the [Groups section](http://cfconventions.org/Data/cf-conventions/cf-conventions-1.11/cf-conventions.html#groups) of the CF Conventions.
The resulting object is logically equivalent to the original, and can be processed by software that isn't able to work with files that use netCDF-4 groups.

### netCDF-Java Library

The [netCDF Java library](https://www.unidata.ucar.edu/software/netcdf-java/) provides an interface for scientific data access.
It can be used to read scientific data from a variety of file formats including netCDF, HDF, GRIB, BUFR, and many others, as well as a variety of remote data access protocols.
It implements the [Unidata Common Data Model](https://docs.unidata.ucar.edu/netcdf-java/current/userguide/common_data_model_overview.html) which uses CF and other metadata conventions in its Coordinate System and Scientific Feature Type layers.
NetCDF-Java can write netCDF-3/4 files that conform to the CF Metadata Conventions.

### THREDDS Data Server (TDS)

The [THREDDS Data Server (TDS)](https://www.unidata.ucar.edu/software/tds/) is a web server that provides metadata and data access for scientific datasets, using OPeNDAP, OGC WMS and WCS, HTTP, and other remote data access protocols.
It is also capable of mapping CF metadata to ISO-19115 though the use of ncISO.
The TDS can use the NetCDF Markup Language (NcML) to modify datasets in-memory to aid in CF conformance without the need to rewrite the files as stored on disk.
The NetCDF Subset Service allows users to subset CF compliant datasets in coordinate space using a REST API.
The service returns subsets as CF compliant netCDF-3/4 files, in addition to other formats.

### xarray - Python Package for working with n-D labeled arrays

[Xarray](http://xarray.pydata.org/) is a python package designed for working with labelled, multi-dimensional array data, built around the netCDF data model.
It uses CF Conventions in several ways, such as encoding / decoding variables and interpreting metadata for visualization.

### `gridded` - A Python API for accessing / working with gridded model results on multiple grid types

[gridded](https://github.com/NOAA-ORR-ERD/gridded) is a python package designed for working with
various grids used for (primarily) met/ocean modeling The goal of this package is to present a
single way to work with results from ANY model -- regardless of what type of grid it was computed on.
Currently supported are:

* Regular Structured Grids (CF Conventions)
* Unstructured Grids (CF + [UGRID Conventions](http://ugrid-conventions.github.io/ugrid-conventions/))
* Staggered Grids (CF + [SGRID Conventions](http://sgrid.github.io/sgrid/))

### xCDAT - Python package for climate data analysis on structured grids

[xCDAT (Xarray Climate Data Analysis Tools)](https://github.com/xCDAT/xcdat) is an extension of [xarray](https://github.com/pydata/xarray) for climate data analysis on structured grids. It serves as a modern successor to the [Community Data Analysis Tools (CDAT)](https://github.com/CDAT/cdat) library.

The goal of xCDAT is to provide generalizable features and utilities for simple and robust analysis of climate data. xCDAT's design philosophy is focused on reducing the overhead required to accomplish certain tasks in xarray. xCDAT aims to be compatible with structured grids that are [CF-compliant](https://cfconventions.org/) (e.g., CMIP6). Some key xCDAT features are inspired by or ported from the core CDAT library, while others leverage powerful libraries in the xarray ecosystem (e.g., [xESMF](https://pangeo-xesmf.readthedocs.io/en/latest/), [xgcm](https://xgcm.readthedocs.io/en/latest/index.html), [cf_xarray](https://cf-xarray.readthedocs.io/en/latest/index.html)) to deliver robust APIs.

### `cf_xarray` - Python package for interpreting CF metadata on xarray objects

[cf_xarray](https://cf-xarray.readthedocs.io/en/latest/index.html) mainly provides an accessor (`DataArray.cf` or `Dataset.cf`) that allows you to interpret [Climate and Forecast metadata convention attributes](http://cfconventions.org/) present on [xarray](https://github.com/pydata/xarray) objects.

## Commercial Software Packages

### ArcGIS Pro

Esri’s [ArcGIS Pro](https://www.esri.com/en-us/arcgis/products/arcgis-pro/overview) supports the ingest, [management](https://pro.arcgis.com/en/pro-app/latest/tool-reference/multidimension/an-overview-of-the-multidimension-toolbox.htm), data visualization, multidimensional analysis, and authoritative sharing of CF-Conventions compliant netCDF data.
NetCDF data can be processed as tables, points, rasters, and, most recently, [discrete sampling geometries](https://pro.arcgis.com/en/pro-app/latest/tool-reference/multidimension/how-netcdf-discrete-sampling-geometry-dsg-tools-work.htm).
In addition, various ArcGIS Pro tools enable multidimensional management (aggregation, subsetting, anomaly detection), [spatio-temporal analysis](https://pro.arcgis.com/en/pro-app/latest/tool-reference/space-time-pattern-mining/an-overview-of-the-space-time-pattern-mining-toolbox.htm) (trend detection, time-series clustering, changepoint detection, hot spot detection), and visualization as 3D features or [voxels](https://pro.arcgis.com/en/pro-app/latest/help/mapping/layer-properties/what-is-a-voxel-layer-.htm).
Analysis results based on netCDF data can be shared and viewed across the web as interactive maps, 3D features, and voxels.
