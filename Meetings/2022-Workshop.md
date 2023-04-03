---
layout: default
title: 2022 CF Workshop
---

# 2022 CF Workshop

## Executive Summary

The 2022 CF Workshop was a hybrid event held on 13-15 September 2022.
The in-person portion of the workshop took place in Santander, Spain at the Institute of Physics of Cantabria ([IFCA]) on the University of Cantabria campus.
There were approximately 100 people from 16 countries registered for the workshop, approximately 20 people attended in-person each day with 40-50 total attending most of the plenary sessions.

Each day of the meeting started with plenary sessions which were followed by parallel hackathon sessions.
The plenary sessions included:
* a review of the recent CF 1.10 release
* a review of the CF Training Workshop held virtually on 8 September 2022
* a review of CF standard names as well as their use in the carbon community
* a discussion of how the World Meteorological Organization (WMO) is starting to use CF-netCDF data
* an update on Zarr and its support in netCDF libraries
* introductions to several of the hackathon topics.

The hackathon topics included:
* Mapping CF Standard Names to I-ADOPT
* Housekeeping on the CF Conventions document
* Describing lossy compression
* GitHub process and automation
* DOIs: for the CF Conventions; for datasets

Three posters were presented and discussed during breaks. Poster topics included:
* ???
* ???
* ???

The workshop ended with reporting out from the hackathon sessions and a final wrap-up session.

In the week before the workshop, a three-hour CF Training Workshop was held.
More information (including videos of the presentations) is available on the [2022 CF Training Workshop page][TRAINING]).

Thanks to IFCA (CSIC-UC, Spain) for hosting both in-person and virtual.

## Decisions and Actions

During the Dataset DOI Discussion
* DECISION: CF is not going to standardize a DOI attribute.
  * Should there be some mention of or guidance around ACDD in the FAQ?
* ACTION: Create a GH issue to capture the discussion during the Data DOI session on use of /reference to ACDD.
* ACTION: Create a GH issue (on website repo) about crafting FAQ around ACDD.

## Documents

All of the presentations and notes for the plenary and hackathon sessions are available in this [Google Drive folder](https://drive.google.com/drive/folders/18BzZixnRUhV8nDqbeRE_ltVvWTF1BzVG).
The notes and summary docs are:
* Notes and discussion from Plenary sessions ([GDoc][Plenary-notes])
* Hackathon debrief notes from 15 Sept ([GDoc][Hackathon-debrief-notes]):
  * I-ADOPT; Housekeeping, CI, and DOI; Lossy Compression
* All presentations are in the [Presentations sub-folder][Presentation-folder]

[Plenary-notes]: https://docs.google.com/document/d/1krLEGKu82-YTAbQ2gWLX5-9cq3q2cjqSqkJZWiDlve4/edit
[Hackathon-debrief-notes]: https://docs.google.com/document/d/10kKCmN6Vi-xBEnJ2fj54OAy7f97AwTQopBJPwKRY3Bw/edit
[Presentation-folder]: https://drive.google.com/drive/u/0/folders/1MO2xZ3dBmyQYz8xLfZJ_ng1yhm_Sme_t

## Agenda

All times are local to Santander, i.e. **UTC+2**

### Tuesday, 13 September 2022

* **09:30 - Welcome, logistics, and introduction** (Antonio S. Cofiño)

* **10:00 - Review of CF-1.10** (David Hassell)

* **10:30 - CF training: Overview and discussion** (Sadie Bartholomew)

* **11:00 -** Coffee break

* **11:30 - CF to BUFR/WMO** (Kevin O’Brien)

* **11:45 - How we describe our variables** (Alison Pamment)

* **12:30 - Standard name challenges in the carbon community** (Steve Jones)

* **13:00 -** Lunch

* **15:00 - Parallel hackathon sessions**
  * **1.** Mapping CF standard names to [I-ADOPT](https://doi.org/10.15497/RDA00071) (Alison Pamment): [Main Zoom Room][MainZoomRoom] 
  * **2.** Housekeeping: Formatting improvements, clarifying general Udunits text, and more (Daniel Lee): [Auxiliary Zoom Room][AuxiliaryZoomRoom]

* **16:30 -** Coffee break

* **17:00 - Parallel hackathon sessions** (continued)

* **18:00 -** Close

### Wednesday, 14 September 2022

* **09:30 - Tuesday recap and discussion**

* **09:45 - netCDF/Zarr** (Ethan Davis)

* **10:15 - Geometries and Grids** (Antonio S. Cofiño)

* **11:00 -** Coffee break

* **11:30 - Requirements for Compression Metadata** (Bryan Lawrence)

* **11:50 - Lossy compression: The netCDF implementation and towards encoding precision** (Charlie Zender)

* **12:20 - Compression: Discussion** (Charlie Zender and Bryan Lawrence)

* **13:00 -** Lunch

* **15:00 - Parallel hackathon sessions**
  * **3.** Conventions enhancements for describing lossy compression (Charlie Zender): [Main Zoom Room][MainZoomRoom]
  * **4.** GitHub processes and automations (Daniel Lee): [Auxiliary Zoom Room][AuxiliaryZoomRoom]

* **16:30 -** Coffee break

* **17:00 - Parallel hackathon sessions** (continued)

* **17:30 -** Social event and dinner

### Thursday, 15 September 2022

* **09:45 - Wednesday recap and discussion**

* **10:00 - Dataset DOIs: Discussion**

* **11:00 -** Coffee break

* **11:30 - Parallel hackathon sessions**
  * **5.** Create DOIs for the CF conventions (Ethan Davis and Kevin O'Brien): [Main Zoom Room][MainZoomRoom] 
  * **6.** Dataset DOIs: Further discussion and conventions enhancements (Ethan Davis and Kevin O'Brien): [Auxiliary Zoom Room][AuxiliaryZoomRoom]

* **13:00 -** Lunch

* **15:00 - Hackathon debriefings** (Charlie Zender, Daniel Lee, Alison Pamment, Ethan Davis, Kevin O'Brien, David Hassell)

* **16:00 -** Coffee break

* **16:30 - Wrap-up, conclusions, and actions** (Antonio S. Cofiño)

* **17:30 -** Close

## The organising committee

* Guilherme Castelão
* Antonio S. Cofiño
* Ethan Davis
* David Hassell (chair)
* Aleksandar Jelenak
* Daniel Lee
* Kevin O'Brien
* Alison Pamment
* Charlie Zender

{::comment}
## Picture from participants
![Participants-Picture]{: height="480px"}
{:/comment}
## Sponsorship

Thanks for their support of this meeting to: 
 - [IS-ENES3] which is funded by the European Union’s Horizon 2020 research and innovation programme under grant agreement No 824084
   
   ![IS-ENES3-logo]{: height="75px"} ![EU-FUNDED-logo]{: height="75px"}
 
 - [CORDyS] funded by the Spanish MCIN/AEI/10.13039/501100011033 (PID2020-116595RB-100)
   
   ![CORDyS-logo]{: height="75px"}
 
 - [Institute of Physics of Cantabria (IFCA, CSIC-UC)][IFCA]

   ![IFCA-logo]{: height="75px"}
 
[IS-ENES3]: https://is.enes.org "Infrastructure for the European Network for Earth System Modelling"
[IS-ENES3-logo]: 2022-workshop/is-enes3-logo.png
[EU-FUNDED-logo]: 2022-workshop/eu_funded_en.jpg
[CORDyS]: https://github.com/AEI-CORDyS "Contribution to the next generation of CORDEX regional climate projections: Dynamical and Statistical approaches"
[CORDyS-logo]: 2022-workshop/micin-aei-cordys_en.png 
[IFCA]: https://ifca.unican.es/en-us "Institute of Physics of Cantabria (IFCA, CSIC-UC)"
[IFCA-logo]: 2022-workshop/ifca-logo.png 
[TRAINING]: http://cfconventions.org/Training/2022-Training-Workshop.html "2022 CF Training Workshop"
[Participants-Picture]: 2022-workshop/Participants-Picture.jpg

*[AEI]: Spanish State Research Agency
*[MCIN]: Spanish Ministry of Science
