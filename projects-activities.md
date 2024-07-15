---
layout: default
title: Projects and Activities that Use the CF Metadata Conventions
---

# Projects and Activities that Use the CF Metadata Conventions

This page lists large projects and activities that draw on the CF Conventions for metadata.
If you have any additions or corrections for this page, please submit an issue on the [CF Website GitHub repo][website-repo] (see the [Contributing Guide][website-contrib] for more details).

The description of each project and activity should give some indication of to what extent the CF conventions are used.

[website-repo]: https://github.com/cf-convention/cf-convention.github.io
[website-contrib]: https://github.com/cf-convention/cf-convention.github.io/blob/master/CONTRIBUTING.md

## Model Intercomparions Projects

Many model intercomparison projects ("MIPs") are under the auspices of the [World Climate Research Programme](https://www.wcrp-climate.org/) and supported by either of the two *core projects* [Earth System Modelling and Observations (ESMO)](https://www.wcrp-climate.org/esmo-overview) and [Regional Information for Society (RIfS)](https://www.wcrp-climate.org/rifs-overview).

### CMIP - Coupled Model Intercomparion Project

The objective of [CMIP](https://www.wcrp-climate.org/wgcm-cmip) is to better understand past, present and future climate changes arising from natural, unforced variability or in response to changes in radiative forcing in a multi-model context. A specific committee, the [WGCM Infrastructure Panel (WIP)](https://www.wcrp-climate.org/wgcm-cmip/wip) is charged with coordinating infrastructure support for CMIP. It works with projects funded to develop software and supporting infrastructure that facilitates access to and analysis of the CMIP model output. It defines specifications and standards that ensure model output is written in a common structure and format, and that it is archived and made accessible worldwide in a common way.  These specifications and standards are collected into a [Data Request (CMIP DRQ)](https://wcrp-cmip.github.io/WGCM_Infrastructure_Panel/CMIP6/data_request.html). 

### CORDEX - Coordinated Downscaling Experiment

The vision of [CORDEX](https://cordex.org) is to advance and coordinate through global partnerships the science and application of regional climate downscaling of data directly from contemporary global climate models. The WCRP views regional downscaling as both an important research topic and an opportunity to engage a broader community of climate scientists in its activities. Regional climate information is more than ever needed for decision-making on societal issues such as vulnerability and adaptation to a changing climate with weather/water extremes. For infrastructure support, data and metadata standards CORDEX draws on and contributes to the work of WIP. Similar to CMIP, these data specifications are collected into a Data Request, the [CORDEX DRQ](https://cordex.org/experiment-guidelines/cordex-cmip6/data-request-cordex-cmip6-rcms/).

### Input4MIPs - Input datasets for Model Intercomparisons Project

[Input4MIPS](https://pcmdi.llnl.gov/mips/input4MIPs/) is an activity to coordinate and make available the boundary condition and forcing datasets needed for CMIP. Various datasets are needed for the pre-industrial control (piControl), AMIP, and historical simulations, and additional datasets are needed for many of the CMIP-endorsed model intercomparison projects (MIPs) experiments.

### Obs4MIPs - Observations for Model Intercomparisons Project

[Obs4MIPs](https://www.wcrp-esmo.org/projects-and-panels/obs4mips) is an effort to make observational data more accessible for climate model evaluation, development and research. It does so by providing observational products technically aligned with climate model data.

### ISIMIP  - Inter-Sectoral Impact Model Intercomparison Project

[ISIMIP](https://www.isimip.org)  offers a framework to compare climate impact projections in different sectors and at different scales. Consistent climate and socio-economic input data provide the basis for a cross-sectoral integration of impact projections. The focus was put on on providing cross-sectorally consistent projections of the impacts of different levels of global warming in the 21st century. The common set of scenarios made use of climate projections from five Global Climate Models (GCMs) driven by the Representative Concentration Pathways (RCPs). Thus, ISIMIP was established as a natural extension of the work done within the Coupled Climate Model Intercomparison Project (CMIP). 
<!-- ***ISIMIP links to CF needs to be established - seems to use basic CMIP style metadata*** -->


## Satellite and remote sensing data

### EUMETSAT - European Organisation for the Exploitation of Meteorological Satellites
[EUMETSAT](https://www.eumetsat.int) uses CF for all data dissemination from the Meteosat Third Generation (geostationary) launched and soon operational, and upcoming EPS Second Generation (polar orbiters), as well as for  numerous joint missions and projects.

### ESA CCI - European Space Agency's Climate Change Initiative

[ESA CCI](https://climate.esa.int/en/) Data Standards are community-driven requirements ensuring consistent essential climate variable (ECV) data production across the CCI programme. Version 2.3 is the latest. The requirements include data production conformance to the network Common Data Form (netCDF) format, the Climate and Forecasting (CF) metadata conventions, the Attribute Convention for Data Discovery (ACDD), and Infrastructure for Spatial Information in the European Community (INSPIRE) compliant discovery metadata.


## Data Portals

### ESGF - Earth System Grid Federation (ESGF)

[ESGF](https://esgf.llnl.gov) is a collaboration involving multiple international organizations that provides access to a vast array of climate data. The software stack that provides the ESGF federated services draws heavily on CF compliant metadata and additional conventions developed and maintained by the different MIPS that ESGF supports. 

<!-- 
### NOAA NCEI -- National Oceanic and Atmospheric Administration's National Centers for Environmental Information

 NOAA [NCEI]()), use CF conventions for many of their climate and oceanographic datasets.
-->

## Copernicus CDS - Copernicus Climate Data Store

Copernicus [CDS](https://cds.climate.copernicus.eu) provides comprehensive climate data and services. Depending on data type several formats are used, including netCDF/CF. External data providers are requested to follow a specified data format that builds on CF (see this [link](https://confluence.ecmwf.int/display/COPSRV/%28version+C3S-0.3%29+Guide+to+NetCDF+encoding+for+C3S+providers) for details).


<!--

## JEDI - Joint Effort for Data assimilation Integration (JEDI)

JEDI is led by the Joint Center for Satellite Data Assimilation (JCSDA), uses CF conventions to handle diverse data types in a unified framework for weather prediction and climate research.


## Arctic Data Center

Managed by the National Center for Ecological Analysis and Synthesis (NCEAS), this repository adheres to CF conventions for its extensive collection of Arctic research data.


## Australian Integrated Marine Observing System (IMOS)

IMOS provides oceanographic data following the CF conventions, ensuring that their datasets are accessible and usable by the wider scientific community.

-->

## Data and metadata standards that build on and extend CF

### WMO Experimental CF-netCDF Profiles

Within the overaching framework of WMO Information System (WIS) three experimental extensions to the Climate and Forecast Conventions (CF conventions) for netCDF (WMO-CF extensions, or *profiles*) have been published. They aim to reduce the effort involved in specifying data products and ensure interoperability by providing standardized semantics and metadata. The level of standardization provided by the WMO-CF extensions is in many cases greater than what is provided by the CF conventions to satisfy the specific WMO operational needs to support Earth System monitoring and prediction. New netCDF profiles are defined to act as templates for reporting data from different sources.  

#### WMO-CF RADIAL 
This *profile* should be used for the representation of weather radar and lidar data in the native instrument-centric polar coordinates. The profile is now published in [WMO-No. 1257](https://library.wmo.int/records/item/68826-guide-to-operational-weather-radar-best-practices?language_id=13&back=&offset=5.). In addition this profile is extended and updated in [CFRadial2](http://dx.doi.org/10.5065/fy2k-x587).

#### WMO-CF MARINE TRAJECTORY

This *profile* should be used for the reporting of meteorological and/or oceanographic observations along one or more trajectories, including both at or near the ocean surface and at depth. The first draft is available via [this webpage](https://community.wmo.int/en/activity-areas/wis/wmo-cf-extensions).

#### WMO-CF UAS TRAJECTORY

This *profile* should be used for the reporting of meteorological, atmospheric chemistry and air quality observations along one or more trajectories from a single platform. The trajectory may follow an undulating profile. The first draft is available via [this webpage](https://community.wmo.int/en/activity-areas/wis/wmo-cf-extensions).

