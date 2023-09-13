---
layout: default
title: Frequently Asked Questions
---

# Frequently Asked Questions (FAQ) about the CF Conventions
{:.no_toc}

This page covers many of the most common questions asked about the Climate and Forecast conventions (and Standard Names).
If you have a question that isn't on this list, please ask it of the CF-metadata mail list, so that the CF community can respond.
We will use that list as the basis for additional content for this set of questions.

Note that many links in this FAQ point to previously released versions of the CF specification.
However, others point to the currently-released CF-1.10 specification.
This may provide better explanations or context, or more advanced capabilities.
But generally these specifications do not conflict with one another, so there is no harm in following a link to a previous version.

The questions are organized by topic.

* TOC
{:toc}

# Questions and Answers
{:.no_toc}

## CF background
This section includes general background about the CF conventions.

### What are the CF conventions, and what do they include?

The conventions for CF (Climate and Forecast) metadata are designed to promote the processing and sharing of files created with the NetCDF API.
The conventions define metadata that provide a definitive description of what the data in each variable represents, and the spatial and temporal properties of the data.
This enables users of data from different sources to decide which quantities are comparable, and facilitates building applications with powerful extraction, regridding, and display capabilities.

### What are the principles of the CF conventions?
Principles of CF include self-describing data (no external tables needed for understanding); metadata equally readable by humans and software; minimum redundancy and maximum simplicity; and a development process focusing on existing needs.

### Who manages the CF conventions?

The CF conventions are maintained by volunteers, led by a Governance Panel and assisted by the Conventions Committee and Standard Names Committee.
(See [CF Governance](governance.md).)
Changes to the conventions are proposed and settled by the community, using the [CF conventions GitHub repository][cf-conventions-repo]'s [issues][cf-conventions-issues] and [pull request][cf-conventions-pulls] functionality for discussion, agreement, and implementing any agreed changes.
Many of the principles of CF operations follow the proposals at these [rules for CF conventions changes](rules.md).

### How long has CF been around? Is it mature?

Work began on CF in 2001 and [Version 1.0](/Data/cf-conventions/cf-conventions-1.0/build/cf-conventions.html) was released in October 2003.
Now at Version 1.10, it has been used for tens of thousands of distinct netCDF products, has an active discussion list with hundreds of participants, and is a mature technical specification.
Because it is community-supported and community-driven, turnaround on questions and changes can take a little time, but are generally thoroughly considered.

### How does CF relate to other conventions/specifications (especially COARDS and netCDF)?

CF is a convention built on top of the netCDF standard, and it generalizes and extends the netCDF [COARDS conventions](https://ferret.pmel.noaa.gov/noaa_coop/coop_cdf_profile.html).
Whereas the netCDF specification is designed to be domain-agnostic, the CF conventions were developed specifically to target climatology and weather forecasting domains.
Since then, the CF conventions have targeted earth science domains more broadly, and expanded from a focus on models to include observational data.

The conventions of netCDF and COARDS are assumed and upheld by CF.
Where COARDS is adequate, CF does not provide an alternative, while all of CF's extensions to COARDS are optional and provide new functionality.

A motivation for developing CF was the need for extra features not found in netCDF or COARDS.
These include conventions for grid-cell boundaries, horizontal grids other than latitude-longitude, recording common statistical operations, standardised identification of physical quantities, non-spatiotemporal axes, climatological statistics and data compression.
These needs were driven by the original user community developing the CF conventions,  the climatology and weather forecasting science community.

## Working with the CF Convention
Learning about and changing the CF convention.

### Do the CF conventions stand alone?

Not entirely; because CF is a netCDF convention, it assumes the netCDF standard is being followed.
And it relies on the UDUNITS system of specifying units (see [Units in CF (UDUNITS)](#units-in-cf-udunits) below).
CF does not replicate the information from these other documents, so to adhere to CF you may need to become familiar with the other specifications as well, particularly the netCDF User's Guide.

The CF Conventions were originally based on the netCDF convention called the [COARDS conventions](https://ferret.pmel.noaa.gov/noaa_coop/coop_cdf_profile.html) (named for their sponsor, the Cooperative Ocean/Atmosphere Research Data Service), developed in 1995.
While there may be a few things in that document that are not documented in CF, working with the CF conventions does not require previous understanding of COARDS.

Aside from those references, a CF principle is to be self-contained.
So for example the CF Standard Names attempt to be as general and well-defined as possible, so the reader does not have to access outside sources to understand the terms.

### How do I find previously asked questions about CF?

The first way is to check this FAQ. If you can't find your question answered here, you could search for it in the [CF discussion GitHub repository][cf-discuss-issues] for questions asked since 2020, or for earlier questions in the [CF mailing list][mailing-list-archive].

### How do I ask questions about CF?

First, please see whether your question has already been answered (see [question above](#how-do-i-find-previously-asked-questions-about-cf)).
Questions about the CF Convention, including its Standard Names list, may be asked by raising new `question` issues in the [CF discussion GitHub repository][cf-discuss-issues].
CF community members usually respond within a day to simple questions, but allow more time if you have an advanced technical topic.

### How do I propose a change?

Changes to the CF standard and the Standard Names are generally proposed first on the [CF discussion GitHub repository][cf-discuss-repo] as an [issue][cf-discuss-issues].
See [How do I ask for a new standard name?](#how-do-i-ask-for-a-new-standard-name) to learn more about changes to the Standard Names list.

A change to the CF standard itself may be discussed initially in an issue in the [CF discussion GitHub repository][cf-discuss-issues], but must be presented and agreed to in detail as a [CF conventions issue][cf-conventions-issues], where the explicit change being requested can be refined.

### What is the process for accepting a change to the CF convention?

The community discusses requests for changes via the mail list and trac site, and may ask questions or recommend changes.
If no one raises objections or concerns about the change (modified as needed to address any issues) for the period of time required for that document, it is considered accepted.
The moderators of the list typically make a final statement of acceptance once that stage has been reached.

More detailed information can be found in the [Rules for CF Conventions Changes](rules.md).

### What is the process for fixing errors?

Errors have a simpler workflow, but still use a community process, as described in the [Rules for Correcting Errors in CF Documents](errors.md).

### When are changes added to the CF Convention?

Changes to the CF Convention itself are grouped into major releases.
Because the proposed changes are visible to the community pending the final release of the convention, major releases may take as long as a year or more to finalize, but users sometimes choose to follow the proposed changes in advance of their release date.

## Common questions about CF details

### My file was written using an earlier version of CF. Is it still compliant?

The compliance is determined by the version number you define in the `Conventions` attribute within each file.
If your file complies with the specifications of the CF version in that attribute, it stays in compliance with CF even as newer versions of the CF Conventions are released.
As a general rule, tools that work with files following the CF Convention should support all versions of the convention.

Where possible, and to date, previously defined elements of the CF Conventions are not invalidated by subsequent versions.

### For vertical coordinates, how does the _positive_ attribute work? 

If your vertical coordinate is some form of pressure, you won't have to worry about the `positive` attribute -- increasing pressure is always 'down' (closer to the center of the earth). 

If your vertical coordinate is anything else, you must provide a positive attribute.
This takes a value of 'up' or 'down', indicating whether more positive values are further away from earth center (up), or toward earth center.
Many standard names which could be used for vertical coordinates state the convention for positive in their definition.
For example, height is defined to have positive direction up, while depth has positive direction down (depth > 0 is below sea level).
However, in some data sets (particularly oceanographic ones) depth values take the opposite sign.
If you specify a coordinate standard name of depth, and a positive attribute value of up, the variable should be interpreted as having an inverted depth direction.
However, this is not recommended; it would be better to use a standard name of height instead.

Note that a standard name attribute is not required for the vertical coordinate, but the `positive` attribute is required if the standard name is not 'pressure'.

Reference: [Trac ticket #109](https://cfconventions.org/Data/Trac-tickets/109.html)

### How (and why) does CF specify directions in standard names?

There are just a few names in CF that are dedicated to specific coordinate directions.
Beyond those special cases, many CF parameters have directional components (up/down, east/west, clockwise/counterclockwise, etc.).
To indicate the positive direction of these parameters' values, CF can include the direction in the standard_name attribute for the variable.
These directional standard names are added only as each direction is requested, so you may see many 'eastward' standard names, but no 'westward' ones, for example.
Because CF does not want to be prescriptive about how data is filtered, it will generally accept requests to add names 'in the opposite direction'.

While it would be possible to separate the directionality of the values from the standard_name (and put it in a 'direction'-style attribute like `positive` for vertical coordinates), this has been avoided, both to simplify compliance and to make interpretation of the values easier for the user.

A list of typical directional components of standard names follows.
These lists are not complete, but provide illustrations of the most common terms that are used.

Components of standard names that are implicitly signed (note that often there is no standard name for the opposing direction):

*  downward, upward
*  northward
*  eastward
*  east_to_x, east_to_y
*  x, y
*  incoming, outgoing
*  emerging
*  backwards
*  downdraft, updraft
*  downwelling, upwelling
*  sinking

Some directional components are not necessarily signed, and so may not be specifying a positive direction per se.
For example, `horizontal` is indicating a plane rather than a direction, while `bidirectional` indicates a directional mode.

*  horizontal, xy, vertical
*  bidirectional, omnidirectional, isotropic
*  meridional
*  radial

### How can I encode flag values (or other enumerated lists) with CF?

Often data values in an enumerated list are given as string codes ("UP", "GOOD", "Warning"), yet it is more useful to encode these values as integers.
CF's [flag_values mechanism](https://cfconventions.org/Data/cf-conventions/cf-conventions-1.10/cf-conventions.html#flags) can encode strings in numeric data variables, while defining flag_meanings to map the numbers to the meanings.
The `flag_values` and `flag_meanings` attributes (and, if necessary, the `flag_masks` attribute) describe a status flag consisting of mutually exclusive coded values.
The `flag_values` attribute is the same type as the variable to which it is attached, and contains a list of the possible flag values.
The `flag_meanings` attribute is a string whose value is a blank-separated list of descriptive words or phrases, one for each flag value. 

### What good is the auxiliary coordinate axis, how is it different from a regular coordinate axis?

In NetCDF, a `coordinate variable` is a one-dimensional variable with the same name as its dimension [e.g., time(time)]; is a numeric data type; has values that are ordered monotonically (always going in one direction); and has no missing values.
If you have a variable that contains coordinate values but does not meet these criteria, in CF you can still indicate that it has coordinate values by naming it as an auxiliary coordinate variable. 

The rules for creating and using auxiliary coordinate variables are described in the [Coordinate Systems](/Data/cf-conventions/cf-conventions-1.10/cf-conventions.html#coordinate-system) section of the Convention.

## Rich technical questions about CF
The detailed and big picture concepts in CF.

### My data variables have an unusual coordinate axis, how do I describe it?

CF allows coordinate variables to be used for any quantity that you might regard as an independent variable on which your data variable depends. 

CF offers a rich set of options for specifying coordinate axes. Here is a short list of possibilities; others may be appropriate.

* [Discrete axes](/Data/cf-conventions/cf-conventions-1.10/cf-conventions.html#discrete-axis) can have unordered, enumerated axis values, like days of the week or model levels [example](/Data/cf-conventions/cf-conventions-1.10/cf-conventions.html#alternative-coordinates).
* Isotherms are described as a data variable of depth with a coordinate of (potential) temperature. 
* Various other vertical coordinate systems that are dimensionless are explicitly listed in [Appendix D](/Data/cf-conventions/cf-conventions-1.10/cf-conventions.html#parametric-v-coord), and are specified as described in [Dimensionless Vertical Coordinates section](/Data/cf-conventions/cf-conventions-1.10/cf-conventions.html#dimensionless-vertical-coordinate).
* Swath coordinates (e.g., 'along-track' and 'across-track' values often obtained from platforms following a path, like satellites, planes, and autonomous underwater vehicles) can be expressed as x,y coordinates that are mapped to latitude and longitude. There are [open proposals](https://github.com/cf-convention/cf-conventions/issues/269) for specifying swath coordinates.
* Degree-day integrals are described as integral_of_air_temperature_deficit|excess_wrt_time with a coordinate of air_temperature_threshold. 
* Electromagnetic radiation at particular wavelengths uses a coordinate of radiation_wavelength or radiation_frequency.

*Suggestion for improvement: add a good example for swath coordinates. Here is [a tentative example]( https://cfconventions.org/Data/wiki/SatelliteExample1.txt).*


### How can I describe a file with multiple time coordinates (e.g., run time AND valid or forecast time)?

There are several ways that multiple time coordinates may be handled; you may wish to review the details in [this list message](https://cfconventions.org/mailing-list-archive/Data/1007.html). 
 
CF's standard name for the valid or forecast time is `time` (also used for the time of an observation).
CF also has a standard name for the time the analysis was performed (its 'run time'): forecast_reference_time.
Very briefly, values in either or both of these axes may vary (a single run may have multiple forecast periods, or multiple runs may target a single period, or multiple runs may target multiple periods).
If either axis contains just a single value, they are both specified as coordinates.
If both are multi-valued, then they are each defined as one-dimensional auxiliary coordinate variables, with a common index dimension. 

CF section 5.7 has an [example of the first case](/Data/cf-conventions/cf-conventions-1.10/cf-conventions.html#scalar-coordinate-variables), with a scalar coordinate variable for forecast_reference_time and a multivalued time axis for the valid time.

An example of the second case can be found in the email referenced above.

### What are Discrete Sampling Geometries? Do I need to worry about them?

Discrete Sampling Geometries, addressed in Section 9 of the CF Conventions, were added to offer greater efficiency and clarity for storing a collection of 'features' in a single file.
Here we define a feature by example: it can be a point, a time series, a trajectory, a profile, a time series (of) profile(s), or a trajectory (of) profile(s).
All of these can be stored in CF-compliant netCDF files, but there was no consistent way to do so and people and programs could not leverage the features in the files.

You don't have to worry about Discrete Sampling Geometries, or DSGs, in order to be CF-compliant.
If you have data that correspond to one of these feature types, you can read the the Discrete Sampling Geometry section to learn how to represent those data so that others can fully leverage them.
(Note: The `feature_type attribute` is reserved for files that represent a Discrete Sampling Geometry.)

### If a variable's time is a time range, what should be used for its time coordinate?

For example, if you have a rainfall accumulation value for a 24-hour period from 20140716 0600 to 20140717 0600, it's obvious these should be the time bounds, but what time coordinate should be used?
The answer calls for judgment, and depends on the data's context.
(The time coordinate might be used for plotting, and also for differentiating in time.)
If the data are simple observations, using the midpoint is reasonable.
(Of course if sensors have a measurement or reporting lag, this should be adjusted for in representing the time of the observation.)
But if the calculation is performed in the context of a model, and the value is used to trigger calculations based on values at the end boundary, it makes more sense to use the endpoint as the time coordinate.

When there is no basis for setting the time to a particular point in the interval, the majority of posters seem to favor the midpoint.

The situation is complicated in the case of a climatology, where the total range of times might include discontinuities.
For instance, specifying 19601201 to 19620301 in climatological bounds defines the northern hemisphere winters (DJF) 1960-1961 and 1961-1962.
The middle of the bounds is the middle of July 1961, which would be a silly coordinate for plotting a winter statistic.
Instead it should be the middle of the *first* time interval to which the climatological statistic applies, making it mid-January 1961.
(Or, if the statistic is an accumulation over multiple years, perhaps the middle of the last time interval.)
Use your good judgment!

### My variable depends on the type of surface. How can I specify the surface type?

CF maintains a vocabulary specifically for specifying surface and area types; it is available on the CF site as the [Area Type Table](/Data/area-type-table/current/build/area-type-table.html), and can also be accessed as a [controlled vocabulary](http://mmisw.org/ont/cf/areatype).

Terms from this vocabulary may be used as specified in the CF Convention [section 7.3.3 Statistics applying to portions of cells](/Data/cf-conventions/cf-conventions-1.10/cf-conventions.html#statistics-applying-portions).
However, it is also possible to describe a data variable by using a named quantity as a coordinate variable, and the area_type is often needed for such a purpose.
The area_type can be attached as a dimensioned coordinate variable, or as a scalar coordinate.

If the area_type you need is not in the list, [request a new area_type name](#how-do-i-ask-for-a-new-standard-name) just as you would a standard name (no units required).

This example adds the area_type as a dimensioned coordinate variable:

```
x=12;
y=15;
time=UNLIMITED;
ntypes=3;
maxlen=40;  # holds any current attribute; can be smaller if your names are shorter

lat(y,x);
lon(y,x);

# This is a coordinate variable of size 3 (ntypes) for surface type (values are in the `data` section):
surface_type(ntypes,maxlen);
surface_type:standard_name="area_type";

surface_temperature(time,ntypes,y,x);
surface_temperature:coordinates = "lat lon surface_type";

data:
# Values for surface_type are specified here
surface_type="crops","natural_grasses","trees";
```

Alternatively, this example specifies a single surface_type for your variable, by using a scalar coordinate variable:

```
x=12;
y=15;
time=UNLIMITED;
ntypes=3;
maxlen=40;

lat(y,x);
lon(y,x);

# This specifies a scalar coordinate variable for surface_type
surface_type(maxlen);
surface_type:standard_name="area_type";
surface_type="trees";

surface_temperature(time,y,x);
surface_temperature:coordinates = "lat lon surface_type";
```

## CF Standard Names
General and specific information about purpose and mechanisms of standard names.

Reference [section 3.3 of the CF Convention, Standard Names](https://cfconventions.org/Data/cf-conventions/cf-conventions-1.10/cf-conventions.html#standard-name)

### What is the official list of standard names?

The CF site contains [the official list of CF standard names and other controlled vocabularies](vocabularies.md).
The XML document pointed to from that page is the primary reference, but the HTML and PDF documents are produced automatically from the XML, and should contain the same information.

Several other sites represent alternative views of knowledge artifacts of the standard names.
See the [Standard Names Tools](#what-tools-exist-to-work-with-standard-names) section for more details.

### What is the purpose of the standard name?

The purpose of the `standard_name` attribute is to provide a succinct and distinguishing description of a variable, in a way that encourages interoperability.
(In this document we often use the phrase 'standard name' to refer to this attribute or its value.)

The standard name is useful for listing and discussing the contents of a file, providing the kind of answer an expert might give to the non-expert's question "What is in that file?"
This helps users share files across disciplines and over time.

The standard name also make it possible for a computer to assess whether a variables is likely to be comparable to another, mathematically and semantically.
This increases interoperability by enabling automated discovery.
Variables with different standard names are presumably not directly comparable.
(Variables with different (that is, incompatible) canonical units are not mathematically comparable, and so are required to have different standard names.)
Of course users must review the details of variables, particularly their `long_name` and `source` attributes, to assess whether they are truly interoperable.

References:
* J Gregory, 2008: [what standard names are for](https://cfconventions.org/mailing-list-archive/Data/2098.html)

### How can I find the standard name I need?

To find standard names that describe your data, open up the latest [Standard Name table](vocabularies.md) (as HTML or XML) and search through it for words typically used for your data.
(Because standard names contain no blanks, you may want to search for one word at a time, or even part of a word, rather than a full phrase like "air temperature".)
If you can not find any matches, you can browse the table to see the kinds of names that exist -- names strongly lean toward environmental modeling and observation data, especially in atmosphere and ocean science.

If you can't find any matches, send an email to the CF-Metadata list describing your variables.
(See the [question on asking for a new standard name](#how-do-i-ask-for-a-new-standard-name).)

### How do I ask for a new standard name?

You ask for a new standard name by raising a new `standard name` issue in the [CF discussion GitHub repository][cf-discuss-issues]. In your issue, specify the following for each standard name you want to request:

* its name,
* its description, and
* its canonical units.

Use other examples from the Standard Names table to model your request, or review past requests in the mail list archives.

### How detailed should a standard name be?

This depends on the application -- there can be standard names for very narrowly defined quantities, and standard names for broad concepts.
The appropriate choice depends on which distinctions need to be made to decide whether another quantity is comparable to the one being defined.

Of course, this broad guideline could result in extraordinarily detailed standard names that will rarely be useful to others.
Because the goal of standard names is to encourage interoperability, there are [several qualifier types that are actively discouraged](#what-shouldnt-be-described-in-a-standard-name). 

### What are the components of a standard name?

A CF standard name is a unique text string, which is associated in the CF Standard Names table to other attributes. 
The text string is made up of two parts: the name (from the CF Standard Names table), and optionally, following the name and one or more blanks, a standard name modifier.
The name contains no white space (underscores separate the words, in practice) and identifies the physical quantity.
The modifier is used to describe a quantity which is related to another variable with the modified standard name.
Details are provided in the convention section on [Standard Name](https://cfconventions.org/Data/cf-conventions/cf-conventions-1.10/cf-conventions.html#standard-name), and examples of modifiers are given in [Appendix C](https://cfconventions.org/Data/cf-conventions/cf-conventions-1.10/cf-conventions.html#standard-name-modifiers). 

Several attributes are required for every standard name: the canonical units, which are *typical* units of the physical quantity, and the description, which clarifies related quantities and meanings of the standard name (but is not strictly a definition per se).
Older standard names may not have a description. 

In addition, standard names that come from certain sources may have GRIB parameter code(s) and/or AMIP identifiers; these are not generally required.

### What is the structure of a good standard name?

A good standard name will typically include several characteristics that, together, characterize your variable.
Common characteristics, or *facets*, include (with examples in parentheses):

* medium or realm of the entity (land, or sea_ice),
* a transformation component (flux, or concentration_of),
* a substance (sea_water, or carbon),
* a state, qualifying the substance or process (atomic, or frozen), and
* a quantity being measured.

The order is not rule-based; the goal is to make the name as clear and natural as possible.
An example standard name with most of the above is mole_concentration_of_atomic_nitrogen_in_air (quantity-transformation-state-substance-medium).

Several structural analyses have been performed on standard names.
For more information, check out [What can be described in a standard name?](#is-there-a-grammar-for-standard-names).

### What can be described in a standard name?

Most of the descriptive terms central to the nature of a substance or concept, including its relation to environmental context, can be described in the CF standard name.
During the review process, the community attempts to normalize the terms to achieve the readability and interoperability goals of the vocabulary.

For an example, one list of the existing standard name facets, based on Raskin SWEET mapping and subsequent re-analysis by Graybeal, is as follows:

  |  |  |  |
 --- | --- | --- | ---  
Surface | Source | Scientific Component | Medium/Realm 
Transformation | Vector Component | Coordinate | Role 
Spectral Band | Energy | Substance | State 
expressed as (Substance or Property) | Fraction | Salinity | Temperature
Quantity | with respect to | defined by | ratio of
ratio to | (product) and | Process | Model 
difference from | difference to | Angle | 
at (Surface or Condition) |in (Substance or Realm) | into | out of
to | from  | reflected by | over
above | below | accumulated in | Statistics 
Condition | assuming (Condition) | due to | excluding  
for  | by | reported on | Artifact State

### What shouldn't be described in a standard name?

The standard name should not include:

* provenance of the variable, including details of the process by which the value was obtained,
* mathematical transformations such as addition, multiplication, and averaging (these are handled by [cell_methods](/Data/cf-conventions/cf-conventions-1.10/cf-conventions.html#cell-methods)),
* specialized terms not meaningful to a broad scientific audience, unless widely used and agreed on by the community of origin,
* acronyms, or
* geospatial location or similar deployment information, for example wind_speed_at_10_meter_platform.

In many cases the standard name is qualified by a specific detail, for example area_type, whose value may change from one set of observations to another or one observation to another.
In these cases the definition for the standard name references one or more attributes or variables where the additional qualifying information may be found.
([Standard name *modifiers*](https://cfconventions.org/Data/cf-conventions/cf-conventions-1.10/cf-conventions.html#standard-name-modifiers) and [cell_methods](https://cfconventions.org/Data/cf-conventions/cf-conventions-1.10/cf-conventions.html#cell-methods) may also be used for this purpose.)
In this way the divergence of the standard names is minimized, and interoperability increased.

### Are there common standard name phrases that get re-used?

Yes, there are phrases and patterns that reappear in different names.
If you have to build a lot of standard names for different types of variables, some existing analyses may be helpful; send a note to the CF-Metadata list for guidance.
If you are creating just a few standard names, it will be easiest to send an initial request using your best guess for the names; the list members will perform the needed comparison to existing usage.

### Is there a grammar for standard names?

There is no adopted grammar for the standard names.
Many investigations or partial forays into a standard grammar have been made.
Among these efforts:

* Karl Taylor ([list post](https://cfconventions.org/mailing-list-archive/Data/2500.html)): A different approach to standard name construction
* Robert Muetzelfeldt ([list post](https://cfconventions.org/mailing-list-archive/Data/2517.html)): [A grammar for CF standard names](http://envarml.pbworks.com/w/page/8988920/FrontPage) / 1103 names
* An interesting [page of keywords](https://cfconventions.org/Data/cf-standard-names/79/build/kwic_index_for_cf_standard_names.html) that resulted
* Jonathan Gregory et al ([list post](https://cfconventions.org/mailing-list-archive/Data/3450.html)): [standard name grammar/Parsing CF standard names](http://www.met.reading.ac.uk/~jonathan/CF_metadata/14.1/) / 2072 names
* Rob Raskin: [mapped CF standard name list to SWEET-based ontologolical representation](https://wiki.earthdata.nasa.gov/download/attachments/50792120/SWEET_SPG.ppt?version=1&modificationDate=1435254939370&api=v2) (Powerpoint) / 2149 names
* John Graybeal (no list post):  [auto-generated pseudo-CF names from CF components](https://github.com/graybealski/cf-conventions-work/blob/master/CF_SWEET_201401_Redacted.xlsx) (Excel) / 2523 names
<!-- * Michael Piasecki/Peng Ji ([list post](https://mailman.cgd.ucar.edu/pipermail/cf-metadata/2012/055875.html)): CF standard names organized by facets [("need reference: old `edscvs.ccny.cuny.edu/cf/index.php?tema=4448` link no longer working")] (TemaTres) / 9981 concepts -->

### Are there mappings of the standard name terms to other terms?

_This answer needs further development, to confirm these details and provide reference links.
Please feel free to offer improvements._

Yes, perhaps most important of these is a mapping within the CF standard names vocabulary performed by a team at BODC.
This provides SKOS-based relationships among CF terms, for example broader and narrower relations.

The CF standard names also have been mapped to the Global Change Master Directory science keywords, and to terms from the SWEET Ontology. 

As of 2014, none of these mappings are regularly updated as new versions of the CF standard names are released.

### What tools exist to work with standard names?

In addition to the results mentioned in the [mappings](#are-there-mappings-of-the-standard-name-terms-to-other-terms), other tools include:

* NERC Vocabulary Server (RDF): http://vocab.nerc.ac.uk/collection/P07/current/
* MARIS Vocabulary Server: http://seadatanet.maris2.nl/v_bodc_vocab_v2/search.asp?lib=P07
* MMI Ontology Registry and Repository (RDF/SPARQL): http://mmisw.org/ont/cf/parameter
* MMI's prototype CF Standard Name search service: https://mmisw.org/ont/mmi/cfonmap

These have been derived from the original XML, and as of this writing (2014) are being updated quickly whenever the original XML is changed.
In fact, the NERC Vocabulary Server is updated simultaneously with the publication of the original XML document.

### Are standard names ever removed from use? How?

Standard names can be 'deprecated' to indicate they are no longer recommended for use.
Existing uses of the name will not cause an error, but new applications should not use a deprecated name. 

Standard names are deprecated when their use becomes ambiguous or confusing, or to say it another way, when they are replaced by one or more terms that are more appropriate (as determined by the standard names community). 

The technical process involving deprecation of a standard name is that it is turned into an alias in the standard names XML file.
The alias includes a pointer to the standard name most closely replacing the deprecated name.
The alias is not shown in the HTML table of standard names.
(As of August 2014, vocabulary servers typically do not show deprecated standard names in their term list, though the NERC Vocabulary Server has a separate list of the deprecated terms.)

## Units in CF (UDUNITS)
These questions are not strictly part of CF, but CF depends on this understanding.

### Why does CF use UDUNITS as its standard?

[UDUNITS](https://www.unidata.ucar.edu/software/udunits/) was specified in the original COARDS convention ("Where possible the units attribute should be formatted as per the recommendations in the Unidata udunits package"), and is a widely used standard with many tools and libraries.
The package contains an extensive unit database, which is in XML format and user-extensible (though the extensions will not be compliant with CF).

There are a few units CF allows that do not appear in UDUNITS; see [the related FAQ question](#are-there-units-in-cf-that-arent-in-udunits).

Note that CF depends on UDUNITS as a standard for formatting the units string, but not as a software package.

### Must a variable have the same units as its standard name's canonical units?

No, not exactly.
If you have a variable with a standard name, its units must be *compatible with* (that is, convertible to) the canonical units of the standard name; but your variable's units do not have to be *the same* as the canonical units.
For example, a variable with standard name wind_speed could have units miles/hour, since those can be converted to the canonical units of meters/second. 

If the units of the variable are not convertible to the standard name's canonical units, this indicates the variable is not really of the same type as the standard name. 

### How do I specify units in CF?

UDUNITS has a small set of base units and another set of 'common' aliases that can be used as base units.
It also specifies a large set of prefixes that can be prepended to the base units.
(All of the components can be specified by their full strings, or by their 'symbol' abbreviations.) 

These combinations can be combined as follows in CF:

* multiplied together, separated by spaces (or a dot, '.', if using symbols);
* taken to an integral power, using '^n' or '**n' notation (or simply appending the power, if using symbols;
* divided by a quotient, using 'per' (or a slash, '/', if using symbols) to indicate the quotient

You can review basic examples in section _6.1 Unit Specification Examples_ of the [UDUNITS documentation](https://docs.unidata.ucar.edu/udunits/current/udunits2lib.html).

More complicated examples of units can be found in the CF Standard Names table, which lists the canonical units for each standard name.

UDUNITS terms can be found in XML on the [UDUNITS github pages](https://github.com/Unidata/UDUNITS-2), specifically in the files udunits2-*.xml under the [lib path](https://github.com/Unidata/UDUNITS-2/tree/master/lib).
The terms can be easily viewed in the MMI ORR repository referenced in the [UDUNITS resources question](#are-there-other-good-resources-about-udunits).

### How do units of time work?

Most time units in CF are specified as being of the form 'time-unit since timestamp', where time-unit is often 'seconds', and the most often used timestamp is '1970-01-01T00:00:00'.
The prefixes specified for UDUNITS prefixes may be applied to the time-unit, for example `milliseconds since 1970-01-01T00:00:00` is a valid unit of time.

### Are there units in CF that aren't in UDUNITS?

_This answer may need updating to reflect current content of UDUNITS._

There are two units acceptable to CF that are not in the UDUNITS library: `sverdrup`, and `decibel` or `dB`.
These have been requested for inclusion in future versions of the UDUNITS library.

The unit `PSU` or `practical salinity unit` was used for salinity terms in CF, but is no longer used; rather, this is considered a dimensionless quantity (unit of 1).

Details of the CF units not in UDUNITS:

* sverdrup:  measure of volume transport, equivalent to 1 million cubic metres per second (264,000,000 USgal/s). Its symbol is Sv, which conflicts with the SI unit symbol for sievert.
* decibel: a logarithmic measure of relative acoustic or energy intensity; symbol dB, db, or dbel (the reference level, needed for logarithmic units, is specified in the standard names that use this canonical unit)

### Are there other good resources about UDUNITS?

The [UDUNITS-2 GitHub repository](https://github.com/Unidata/UDUNITS-2) contains working code and documentation.

The [API-Guide](https://docs.unidata.ucar.edu/udunits/current/udunits2lib.html) contains some detailed information, but it is oriented entirely for developers. 

A [units conversion page on the ERDDAP site](http://coastwatch.pfeg.noaa.gov/erddap/convert/units.html) lets you try different unit strings, and provides additional context on UDUNITS (and UCUM units) further down the page.

The strings (names) corresponding to accepted UDUNITS can be found in the UDUNITS vocabulary entries at the MMI Ontology Registry and Repository:

* http://mmisw.org/ont/mmi/udunits2-prefixes
* http://mmisw.org/ont/mmi/udunits2-base
* http://mmisw.org/ont/mmi/udunits2-common
* http://mmisw.org/ont/mmi/udunits2-accepted
* http://mmisw.org/ont/mmi/udunits2-derived

The repository also contains codes for each of the defined units in UDUNITS, which can be used if a unique identifier is needed to refer to a specific UDUNITS unit.

## Maintaining the CF standard
This section is about the meta-question of procedures involved to update CF standards documentation.

### Who physically maintains the standards documentation?

Alison Pamment of the [Science and Technologies Facility Council](http://stfc.ac.uk) maintains the CF Standard Names documentation.

A team at Lawrence Livermore National Lab maintains documents and content on the CF web site; Matthew Harris is the primary updater of that site.
As the site is maintained in a GitHub repository (see [this item](#where-is-the-documentation-stored), below), other members of the community may contribute modifications for inclusion on the site.

### Where is the documentation stored?

The documentation is stored on [this GitHub repository](https://github.com/cf-convention/cf-convention.github.io), and its format is converted using Jekyll to present it on the CF web site. 

### Can I fork (get a copy of) the repository?

Yes, the repository is public and can be forked.
We suggest you contact CF via the CF-metadata mail list before making pull requests, however.
There are various maintenance processes going on behind the scenes to update the various CF content, so changing files directly may not produce the desired results.

### How can I submit suggested changes?

Once you understand the procedure by which your suggested changes should be approved (e.g., email approval on the CF-metadata list, a trac ticket, or some other arrangement), you can submit suggested changes as a pull request on the appropriate content.
However, as noted above, this should first be agreed with the person overseeing that content.

[cf-conventions-repo]: https://github.com/cf-convention/cf-conventions
[cf-conventions-issues]: https://github.com/cf-convention/cf-conventions/issues
[cf-conventions-pulls]: https://github.com/cf-convention/cf-conventions/pulls
[cf-discuss-repo]: https://github.com/cf-convention/discuss
[cf-discuss-issues]: https://github.com/cf-convention/discuss/issues
[cf-website-repo]: https://github.com/cf-convention/cf-convention.github.io
[cf-website-issues]: https://github.com/cf-convention/cf-convention.github.io/issues
[cf-website-pulls]: https://github.com/cf-convention/cf-convention.github.io/pulls
[mailing-list-archive]: https://cfconventions.org/mailing-list-archive/Data
