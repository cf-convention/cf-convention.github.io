---
layout: default
title: WKT/PROJ.4
---
# CF &rlhar; WKT/PROJ.4 translation

## Mapping from CF Grid Mapping Attributes to CRS WKT Elements

These mappings were compiled by Etienne Tourigny and Phil Bentley to support CF trac tickets [69](https://cfconventions.org/Data/Trac-tickets/69.html) and [80](https://cfconventions.org/Data/Trac-tickets/80.html), which were subsequently implemented in CF version 1.7.
The [web page](https://cfconventions.org/wkt-proj-4.html) you are reading is an edited version of the [GitHub wiki page](https://github.com/cf-convention/cf-conventions/wiki/Mapping-from-CF-Grid-Mapping-Attributes-to-CRS-WKT-Elements), itself a copy from the obsolete trac wiki.

In Tables 1 and 2 the names of WKT PARAMETER elements follow the names of coordinate operation parameters defined in the [EPSG geodetic parameter registry](https://epsg.org).
The later tables list translations of projection parameter names between CF and various other representations (such as OGC WKT, EPSG and PROJ.4).
The information was obtained from various sources.

The various representations listed are:

*   **CF** The CF grid mapping attribute names, of which the definitive list is [Table F.1 of the CF convention](https://cfconventions.org/cf-conventions/cf-conventions.html#table-grid-mapping-attributes)
*   **OGC WKT** The names following OGC WKT specification (used by GDAL/OGR and CadCorp(?))
*   **PROJ.4** The names used in the PROJ.4 software (https://proj.org)
*   **EPSG** The names and codes used in the EPSG Geodetic Parameter Dataset (https://epsg.org)
*   **GeoTIFF ID** The names used in the GeoTIFF raster format (https://trac.osgeo.org/geotiff)

### Table 1 - CF Grid Mapping Attributes with numerical values

| **CF Grid Mapping Attribute**  | **Corresponding WKT Syntax** (1) |
| azimuth_of_central_line | PARAMETER["Azimuth", *value*]
| earth_radius  | SPHEROID["*reference_ellipsoid_name*", *semi_major_axis*, 0.0, ...] 
| false_easting  | PARAMETER["False easting", *value*] 
| false_northing  | PARAMETER["False northing", *value*] 
| grid_mapping_name  | no known equivalent 
| grid_north_pole_latitude  | no known equivalent 
| grid_north_pole_longitude  | no known equivalent 
| inverse_flattening  | SPHEROID["*reference_ellipsoid_name*", *semi_major_axis*, *inverse_flattening*, ...] 
| latitude_of_projection_origin  | PARAMETER["Latitude of natural origin", *value*] 
| longitude_of_central_meridian  | PARAMETER["Longitude of natural origin", *value*] 
| longitude_of_prime_meridian  | PRIMEM["*prime_meridian_name*", *longitude_of_prime_meridian*, ...] 
| longitude_of_projection_origin  | PARAMETER["Longitude of natural origin", *value*] 
| north_pole_grid_longitude  | no known equivalent 
| perspective_point_height  | PARAMETER["Viewpoint height", *value*] 
| scale_factor_at_central_meridian  | PARAMETER["Scale factor at natural origin", *value*] 
| scale_factor_at_projection_origin  | PARAMETER["Scale factor at natural origin", *value*] 
| semi_major_axis  | SPHEROID["*reference_ellipsoid_name*", *semi_major_axis*, *inverse_flattening*, ...] 
| semi_minor_axis  | no direct equivalent, the SPHEROID element is used to define ellipsoid geometry 
| standard_parallel (one parallel)  | PARAMETER["Latitude of standard parallel", *value*] 
| standard_parallel (two parallels)  | PARAMETER["Latitude of 1st standard parallel", *value*], PARAMETER["Latitude of 2nd standard parallel", *value*] 
| straight_vertical_longitude_from_pole  | PARAMETER["Longitude of origin", *value*] 
| towgs84  | GEOGCS["*name*", DATUM["*name*", TOWGS84[*7 params*] ]  | +towgs84 
{: class="table table-striped"}

---

### Table 2 - CF Grid Mapping Attributes with string values

---

| **CF Grid Mapping Attribute**  | **Corresponding WKT Syntax** (1)  | **PROJ.4 Syntax** |  
| fixed_angle_axis | no known equivalent | specify the other axis with +sweep
| geographic_crs_name  | GEOGCS["*geographic_coordinate_system_name*", ...]  | N/A
| geoid_name | VERT_DATUM["*vertical_datum_name*", ...] | N/A
| geopotential_datum_name  | VERT_DATUM["*vertical_datum_name*", ...] | N/A 
| horizontal_datum_name  | GEOGCS["*name*", DATUM["*horizontal_datum_name*", ...] ]  | +datum 
| prime_meridian_name  | GEOGCS["*name*",PRIMEM["*prime_meridian_name*",*value*]  | +pm 
| projected_crs_name  | PROJCS["*projected_coordinate_system_name*", ...]  | N/A 
| reference_ellipsoid_name  | GEOGCS["*name*", DATUM["*name*", SPHEROID["*reference_ellipsoid_name*", ...] ] ]  | +ellps
| sweep_angle_axis | no known equivalent | +sweep
{: class="table table-striped"}

---

See also the following files, which list the various possible Datum, Ellipsoid and Prime Meridian names. (They were produced in support of CF trac ticket [80](https://cfconventions.org/Data/Trac-tickets/80.html).)

*   [`horiz_datum.csv`](https://github.com/cf-convention/cf-conventions/wiki/csv/horiz_datum.csv) - horizontal datum parameters for use as reference for CF-1.7 (source: GDAL/OGR, modified by Etienne Tourigny)
*   [`ellipsoid.csv`](https://github.com/cf-convention/cf-conventions/wiki/csv/ellipsoid.csv) - Ellipsoid parameters from the EPSG database (source: GDAL/OGR)
*   [`prime_meridian.csv`](https://github.com/cf-convention/cf-conventions/wiki/csv/prime_meridian.csv) - Prime Meridian parameters from the EPSG database (source: GDAL/OGR)

### Table 3 - Common projection parameter names

---

|**CF** |**OGC WKT** |**PROJ.4** |**EPSG name** |**Note**
|false_easting |false_easting |+x_0 |False easting / Easting at false origin |(2)
|false_northing |false_northing |+y_0 |False northing / Northing at false origin |(2)
|scale_factor_at_projection_origin |scale_factor |+k_0 |Scale factor at natural origin |(1)
|scale_factor_at_central_meridian |scale_factor |+k_0 |Scale factor at natural origin |(1)
|standard_parallel![1] |standard_parallel_1 |+lat_1 |Latitude of 1st standard parallel | 
|standard_parallel![2] |standard_parallel_2 |+lat_2 |Latitude of 2nd standard parallel | 
|longitude_of_central_meridian |longitude_of_center / central_meridian |+lon_0 |(1) |(1)
|longitude_of_projection_origin |longitude_of_center / central_meridian |+lon_0 |(1) |(1)
|latitude_of_projection_origin |latitude_of_origin / latitude_of_center |+lat_0 |(1) |(1)
|straight_vertical_longitude_from_pole |central_meridian |+lon_0 |(1) |(1)
{: class="table table-striped"}

---

### Table 4 - Specific projection parameter names

---

|**Projection** |**Name** |**CF** |**OGC WKT** |**PROJ.4** |**EPSG name** |**EPSG code** |**GeoTIFF ID** |**Note**
|**AEA** |Albers Equal Area |albers_conical_equal_area |Albers_Conic_Equal_Area |+proj#aea |Albers Equal Area |9822 |CT_AlbersEqualArea | 
|  |  |standard_parallel![1] |standard_parallel_1 |+lat_1 |Latitude of 1st standard parallel |8823 |!StdParallel1 | 
|  |  |standard_parallel![2] |standard_parallel_2 |+lat_2 |Latitude of 2nd standard parallel |8824 |!StdParallel2 | 
|  |  |longitude_of_central_meridian |longitude_of_center |+lon_0 |Longitude of false origin |8822 |NatOriginLong | 
|  |  |latitude_of_projection_origin |latitude_of_center |+lat_0 |Latitude of false origin |8821 |NatOriginLat | 
| |false_easting |false_easting |+x_0 |Easting at false origin |8826 |FalseEasting |
| |false_northing |false_northing |+y_0 |Northing at false origin |8827 |FalseNorthing |
|  |  |  |  |  |  |  |  | 
|**AE** |Azimuthal equidistant |azimuthal_equidistant |Azimuthal_Equidistant |+proj#aeqd |N/A |N/A |CT_AzimuthalEquidistant  |EPSG:9832 is 'Modified Azimuthal Equidistant'
|  |  |longitude_of_projection_origin |longitude_of_center |+lon_0 2+^|  |ProjCenterLong | 
|  |  |latitude_of_projection_origin |latitude_of_center |+lat_0 2+^|  |ProjCenterLat | 
| |false_easting |false_easting |+x_0 | |FalseEasting |
| |false_northing |false_northing |+y_0 | |FalseNorthing |
|  |  |  |  |  |  |  |  | 
|**LAEA** |Lambert azimuthal equal area |lambert_azimuthal_equal_area |Lambert_Azimuthal_Equal_Area |+proj#laea |Lambert Azimuthal Equal Area |9820 |CT_LambertAzimEqualArea  | 
|  |  |longitude_of_projection_origin |longitude_of_center |+lon_0 |Longitude of natural origin |8802 |ProjCenterLong | 
|  |  |latitude_of_projection_origin |latitude_of_center |+lat_0 |Latitude of natural origin |8801 |ProjCenterLat | 
| |false_easting |false_easting |+x_0 |False easting |8806 |FalseEasting |
| |false_northing |false_northing |+y_0 |False northing |8807 |FalseNorthing |
|  |  |  |  |  |  |  |  | 
|**LCC-1SP** |Lambert conformal |lambert_conformal_conic |Lambert_Conformal_Conic_1SP |+proj#lcc |Lambert Conic Conformal (1SP) |9801 |CT_LambertConfConic_1SP |
|  |  |standard_parallel |latitude_of_origin |+lat_1 |Latitude of natural origin |8801 |NatOriginLat |standard_parallel#latitude_of_projection_origin
|  |  |longitude_of_central_meridian |central_meridian |+lon_0 |Longitude of natural origin |8802 |NatOriginLong | 
|  |  |latitude_of_projection_origin |latitude_of_origin |+lat_0 |Latitude of natural origin |8801 |NatOriginLat | 
|  |  |N/A |scale_factor |+k_0 |Scale factor at natural origin |8805 |ScaleAtNatOrigin |(3) always 1
| |false_easting |false_easting |+x_0 |False easting |8806 |FalseEasting |
| |false_northing |false_northing |+y_0 |False northing |8807 |FalseNorthing |
|  |  |  |  |  |  |  |  | 
|**LCC-2SP** |Lambert conformal |lambert_conformal_conic |Lambert_Conformal_Conic_2SP |+proj#lcc |Lambert Conic Conformal (2SP) |9802 |CT_LambertConfConic_2SP  |
|  |  |standard_parallel![1] |standard_parallel_1 |+lat_1 |Latitude of 1st standard parallel |8823 |!StdParallel1 | 
|  |  |standard_parallel![2] |standard_parallel_2 |+lat_2 |Latitude of 2nd standard parallel |8824 |!StdParallel2 | 
|  |  |longitude_of_central_meridian |central_meridian |+lon_0 |Longitude of false origin |8822 |FalseOriginLong | 
|  |  |latitude_of_projection_origin |latitude_of_origin |+lat_0 |Latitude of false origin |8821 |FalseOriginLat | 
| |false_easting |false_easting |+x_0 |Easting at false origin |8826 |FalseEasting |
| |false_northing |false_northing |+y_0 |Northing at false origin |8827 |FalseNorthing |
|  |  |  |  |  |  |  |  | 
|**CEA** |Lambert cylindrical equal area |lambert_cylindrical_equal_area |Cylindrical_Equal_Area |+proj#cea |N/A 2+^|CT_CylindricalEqualArea  |(3) CF says EPSG 9834/9835 ?
|  |  |longitude_of_central_meridian |central_meridian |+lon_0 2+^|  |NatOriginLong | 
|  |  |standard_parallel![1] |standard_parallel_1 |+lat_ts | |!StdParallel1 |default to 0
| |false_easting |false_easting |+x_0 | |FalseEasting |
| |false_northing |false_northing |+y_0 | |FalseNorthing |
|  |  |  |  |  |  |  |  | 
|**M-1SP** |Mercator (1SP) |mercator |Mercator_1SP |+proj#merc |Mercator (variant A) |9804 |Mercator_1SP |(3)
|  |  |longitude_of_projection_origin |central_meridian |+lon_0 |Longitude of natural origin |8801 |NatOriginLong | 
|  |  |scale_factor_at_projection_origin |scale_factor |+k_0 |Scale factor at natural origin |8805 |ScaleAtNatOrigin | 
| |false_easting |false_easting |+x_0 |False easting |8806 |FalseEasting |
| |false_northing |false_northing |+y_0 |False northing |8807 |FalseNorthing |
|  |  |  |  |  |  |  |  | 
|**M-2SP** |Mercator (2SP) |mercator |Mercator_2SP |+proj#merc |Mercator (variant B) |9805 |N/A |(3)
|  |  |longitude_of_projection_origin |central_meridian |+lon_0 |Longitude of natural origin |8801 | |
|  |  |standard_parallel![1] |standard_parallel_1 |+lat_ts |Latitude of 1st standard parallel |8823 | |
| |false_easting |false_easting |+x_0 |False easting |8806 |FalseEasting |
| |false_northing |false_northing |+y_0 |False northing |8807 |FalseNorthing |
|  |  |  |  |  |  |  |  | 
|**Ortho** |Orthographic |orthographic |Orthographic |+proj#ortho |Orthographic |9840 |CT_Orthographic | 
|  |  |longitude_of_projection_origin |central_meridian |+lon_0 |Longitude of natural origin |8802 |ProjCenterLong | 
|  |  |latitude_of_projection_origin |latitude_of_origin |+lat_0 |Latitude of natural origin |8801 |ProjCenterLat | 
| |false_easting |false_easting |+x_0 |False easting |8806 |FalseEasting |
| |false_northing |false_northing |+y_0 |False northing |8807 |FalseNorthing |
|  |  |  |  |  |  |  |  | 
|**PS-A** |Polar stereographic |polar_stereographic |Polar_Stereographic |+proj#stere |Polar Stereographic (variant A) |9810 |CT_PolarStereographic  |(3) 
|  |  |straight_vertical_longitude_from_pole   |central_meridian |+lon_0 |Longitude of natural origin |8802 |StraightVertPoleLong |
| |latitude_of_projection_origin |N/A |+lat_0 |Latitude of natural origin |8801 |NatOriginLat |+90/-90
|  |  |scale_factor_at_projection_origin |scale_factor |+k_0 |Scale factor at natural origin |8805 |ScaleAtNatOrigin | 
| |false_easting |false_easting |+x_0 |False easting |8806 |FalseEasting |
| |false_northing |false_northing |+y_0 |False northing |8807 |FalseNorthing |
|  |  |  |  |  |  |  |  | 
|**PS-B** |Polar stereographic |polar_stereographic |Polar_Stereographic |+proj#stere |Polar Stereographic (variant B) |9829 |N/A |(3)
|  |  |straight_vertical_longitude_from_pole   |central_meridian |+lon_0 |Longitude of natural origin |8802 ||
| |latitude_of_projection_origin |N/A |+lat_0 |Longitude of origin |8801 |+90/-90 |
| |standard_parallel |latitude_of_origin |+lat_ts |Latitude of standard parallel |8832 ||
| |false_easting |false_easting |+x_0 |False easting |8806 |FalseEasting |
| |false_northing |false_northing |+y_0 |False northing |8807 |FalseNorthing |
|  |  |  |  |  |  |  |  | 
|**St** |Stereographic |stereographic |Stereographic |+proj#stere |N/A 2+^|CT_Stereographic |EPSG 9809 is “Oblique Stereographic” or “Double Stereographic”
|  |  |longitude_of_projection_origin |central_meridian |+lon_0 2+^|  |ProjCenterLong | 
|  |  |latitude_of_projection_origin |latitude_of_origin |+lat_0 2+^|  |ProjCenterLat | 
|  |  |scale_factor_at_projection_origin |scale_factor |+k_0 2+^|  |ScaleAtNatOrigin | 
| |false_easting |false_easting |+x_0 | |FalseEasting |
| |false_northing |false_northing |+y_0 | |FalseNorthing |
|  |  |  |  |  |  |  |  | 
|**TM** |Transverse Mercator |transverse_mercator |Transverse_Mercator |+proj#tmerc |Transverse Mercator |9807 |CT_TransverseMercator |(3)
|  |  |scale_factor_at_central_meridian |scale_factor |+k_0 |Scale factor at natural origin |8805 |ScaleAtNatOrigin | 
|  |  |longitude_of_central_meridian |central_meridian |+lon_0 |Longitude of natural origin |8802 |NatOriginLong | 
|  |  |latitude_of_projection_origin |latitude_of_origin |+lat_0 |Latitude of natural origin |8801 |NatOriginLat | 
| |false_easting |false_easting |+x_0 |False easting |8806 |FalseEasting |
| |false_northing |false_northing |+y_0 |False northing |8807 |FalseNorthing |
{: class="table table-striped"}

---

### **Table Notes:**

1.  Multiple CF/WKT translations, see projection-specific translations.
2.  Parameter used in every projection.
3.  See projection-specific notes.

### Units Information

Translation of units depends on if the crs is geographic or projected.

For a geographic crs (grid_mapping_name # "latitude_longitude"), units are angular.
GEOGCS contains a UNIT node which gives the conversion to radians.
When the crs is in degrees the following node is used: UNIT["degree",0.0174532925199433].
For a more complete description, see CT 1.0 section "7.3.19 UNIT"
CF requires all value to be in degrees, which is specified in the dimension's units attribute ( lon:units # "degrees_east" / lat:units # "degrees_north" ), the udunits packages allows to transform from radians.

For a projected crs, units are linear.
PROJCS must contains a UNIT node which gives the conversion into meters.
For example, if the units are in kilometers the following node is used: UNIT["kilometre",1000]].
In CF, units are given in the dimension's units attribute (xc:units # "m").

### Projection-specific notes

EPSG codes below correspond to "EPSG dataset coordinate operation method" codes.

#### Lambert conformal 1SP / 2SP

The 1SP variant corresponds to EPSG code 9801 - Lambert Conic Conformal (1SP), with CF latitude_of_projection_origin#standard_parallel and WKT scale_factor#1.
A scale factor less than 1 means that there are 2 standard parallels, but it cannot be translated to the CF 1SP variant, therefore the 2SP variant should be used instead.
The 2SP variant corresponds to EPSG code 9802 - Lambert Conic Conformal (2SP).

#### Lambert cylindrical equal area

The scale_factor_at_projection_origin variant is not recommended as it does not translate to and from WKT/PROJ.4.
Snyder formulas 10-2b and 10-2 can be used to relate scale_factor_at_projection_origin, standard_parallel1 and latitude_of_projection_origin but the latter is not part of this projection's parameters.
It has been proposed to deprecate or remove this variant from the CF spec (see CF trac ticket [75](https://cfconventions.org/Data/Trac-tickets/75.html)).

#### Mercator 1SP / 2SP

The scale_factor_at_projection_origin variant corresponds to EPSG code 9804 - Mercator (1SP) or Mercator (variant A), and the standard_parallel variant corresponds to EPSG code 9805 - Mercator (2SP) or Mercator (variant B).

#### Polar stereographic

The standard_parallel variant corresponds to EPSG code 9829 - Polar Stereographic (Variant B), while the scale_factor_at_projection_origin variant corresponds to EPSG code 9810 - Polar Stereographic (Variant A).
As WKT/PROJ.4 require the standard parallel, [Snyder] formula 21-7 can be used to compute it from scale_factor_at_projection_origin if that variant is used.

#### Transverse Mercator

Transverse Mercator can be translated to PROJ.4 using either +proj#tmerc (Transverse Mercator) or +proj#utm (Universal Transverse Mercator) by computing zone number from longitude_of_central_meridian.
For example, a TM projection with longitude_of_central_meridian#-117 would have the corresponding PROJ.4 string: '+proj#utm +zone#11 +datum#NAD27 +units#m +no_defs '
