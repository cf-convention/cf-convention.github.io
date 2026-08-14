---
title: "CF Conventions Community Workshop 2026"
layout: page
last_checked: 2026-06-30
---
<style>
/* Same column layout for all agenda tables */
table.agenda {
  width: 100%;
  table-layout: auto; /* let Time/Room size to content */
}

/* Top-align cells; allow wrapping in text columns */
table.agenda > thead > tr > th,
table.agenda > tbody > tr > td {
  vertical-align: top;
  overflow-wrap: anywhere;
}

/* Col 1: Time — shrink to content, no wrap, centered */
table.agenda > thead > tr > th:nth-child(1),
table.agenda > tbody > tr > td:nth-child(1) {
  white-space: nowrap;
  width: 1%;              /* shrink-to-fit */
  text-align: center;
}

/* Col 2: Room — shrink to content, no wrap, centered */
table.agenda > thead > tr > th:nth-child(2),
table.agenda > tbody > tr > td:nth-child(2) {
  white-space: nowrap;
  width: 1%;              /* shrink-to-fit */
  text-align: center;
}

/* Col 3: Session — wrap, take ~50% of remaining width */
table.agenda > thead > tr > th:nth-child(3),
table.agenda > tbody > tr > td:nth-child(3) {
  width: 50%;
  text-align: left;
}

/* Col 4: Presenter/Chair — wrap, take ~50% of remaining width */
table.agenda > thead > tr > th:nth-child(4),
table.agenda > tbody > tr > td:nth-child(4) {
  width: 50%;
  text-align: left;
}

/* Small screens: keep layout and allow horizontal scroll if needed */
@media (max-width: 900px) {
  table.agenda {
    display: block;
    overflow-x: auto;
    -webkit-overflow-scrolling: touch;
  }
}
</style>

# CF Conventions Community Workshop 2026

- **Dates:** 21-24 September 2026  
- **Time:** Starts at 13:00 CEST on the first day and ends at 14:00 CEST on the final day (Lunch from 12:30 CEST).
- **Location:** ECMWF, Bonn, Germany and online  
- **Format:** Hybrid event  
- **Registration:** [ECMWF Events registration page](https://events.ecmwf.int/event/568/registrations/440/)  
- **Event pages:** [ECMWF Events](https://events.ecmwf.int/event/568/) and [Copernicus Climate Change Service](https://climate.copernicus.eu/cf-conventions-community-workshop-2026)

This page records the main information for the 2026 CF Conventions Community Workshop for the CF Conventions meeting archive. The official event and registration pages are hosted by ECMWF and the Copernicus Climate Change Service.

## Overview

The 2026 CF Conventions Community Workshop is a scientific and technical workshop for the international community working with Climate and Forecast (CF) metadata conventions, environmental data standards, and interoperable data systems.

The workshop is designed to bring together researchers, developers, data engineers, infrastructure specialists, CF contributors, and users of CF-compliant datasets. The meeting will combine plenary sessions, invited and contributed talks, thematic discussions, breakout sessions, and hands-on hackathons.

The workshop is co-hosted by:

- CF Conventions Community
- Copernicus Climate Change Service (C3S)
- European Centre for Medium-Range Weather Forecasts (ECMWF)

## Objectives

The workshop aims to support collaboration across the CF community, contribute to the evolution and adoption of CF metadata standards, and make practical progress on CF-compliant data and tools.

Themes highlighted for the 2026 workshop include:

- GRIB to CF
- Applying CF to different data formats
- Encoding uncertainty metadata in CF

Additional topics and community suggestions are welcome through the programme discussion channels listed below.

## Programme and contributions

The programme will combine presentations and collaborative sessions. Planned formats include plenary sessions, keynote and contributed presentations, lightning talks, thematic discussions, parallel breakout sessions, hackathons, and reporting-back sessions. A poster session may also be organised depending on interest and available space.

Community input is being collected through GitHub Discussions:

- [Call for breakout and hackathon sessions](https://github.com/orgs/cf-convention/discussions/476)
- [Call for talks and presentations](https://github.com/orgs/cf-convention/discussions/475)

Participants wishing to propose a presentation, poster, breakout, or hackathon topic should use the relevant GitHub discussion. The published deadline for contributions is **17 August 2026**.

A detailed agenda will be published closer to the event.

## Participation and registration

The workshop will take place in hybrid format, with participation possible both on site in Bonn and online.

Participants are encouraged to register early. The published registration deadline is **14 September 2026**.

Registration is handled through the ECMWF Events page:

- [Register for the CF Conventions Community Workshop 2026](https://events.ecmwf.int/event/568/registrations/440/)

Online participation links will be provided by the organisers in due course.

## Venue

The in-person component of the workshop will be hosted at ECMWF in Bonn, Germany.

ECMWF's Bonn premises provide conference and collaboration facilities suitable for hybrid participation. The venue is accessible by public transport; the Copernicus event page notes that participants can travel from Bonn Central Station using underground line 66 towards Ramersdorf, alighting at Robert-Schuman-Platz.

Further local travel information is available from ECMWF:

- [ECMWF Bonn location information](https://www.ecmwf.int/en/about/location/ecmwf-bonn)

## Accommodation

The Copernicus event page lists several accommodation options in Bonn, including hotels in the city centre with public transport links and options within walking distance of ECMWF.

Participants should consult the official event pages for the most up-to-date accommodation and travel advice.

## Code of conduct and contact

The event is subject to the code of conduct published by the organisers on the official event pages. Participants are expected to behave professionally and respectfully and to help maintain a safe and inclusive environment.

For event-related questions, the published contact address is:

- copernicus-events@ecmwf.int

## Archival notes

This page is intended as a CF-maintained archival and curation record for the 2026 workshop. The operational event information, registration form, programme updates, participation links, travel information, and code of conduct are maintained on the official ECMWF and Copernicus event pages.

Sources checked on 30 June 2026:

- <https://events.ecmwf.int/event/568/>
- <https://climate.copernicus.eu/cf-conventions-community-workshop-2026>

## Draft Agenda

### Day 1 - Monday, 21 September 2026

{: .agenda .table .table-bordered .table-striped}
| Local Time (Bonn)   | Room   | Session  | Presenter/Chair   |
|:-------------|:-------|:-----------------------------------------------------|:----------------------------------------------|
| 13:00 | Main   | Arrivals and coffee |   |
| 14:00 | Main   | Welcome and Overview of meeting structure  | TBD  |
| 14:10 | Main   | Introduction to CF |  Jonathan Gregory  |
|       |        | CF Governance Processes |  Ethan Davis  |
|       |        | What will be in CF 1.14 | Sadie Bartholomew    |
| 15:00 | Main   | Coffee break / screen break |  |
| 15:30 | Main   | Standard names / Vocabularies | Alison Pamment   |
| 16:00 | Main | Introduction to today's breakout sessions | |
| 16:10 |      | Breakouts / Hackathons | |
|       | Room? | CF Profiles, work through with Satellite Swath data | Ethan Davis |
|       | Room? | ??? | ??? |
| 17:30 |       | Adjorn |  |
| 19:00? | TBD | Workshop dinner |  |

### Day 2 - Tuesday, 22 September 2026

{: .agenda .table .table-bordered .table-striped}
| Local Time (Bonn)   | Room   | Session  | Presenter/Chair   |
|:-------------|:-------|:-----------------------------------------------------|:----------------------------------------------|
| 09:00 | Main   | Coffee and welcome |   |
| 09:30 | Main   | Uncertainty metadata in CF | David Hassell, Sam Hunt  |
| 10:00 | Main   | Units of measure in CF and elsewhere | Lars Bärring  |
| 10:30 | Main   | Coffee break / screen break |  |
| 11:00 | Main | Introduction to today's breakout sessions | |
| 11:10 |      | Breakouts / Hackathons | |
|       | Room? | Uncertainty | David Hassell |
|       | Room? | BCP 14 | Sadie Bartholemew |
| 12:30 |        | Lunch break |  |
| 14:00 | Main   | CF and GRIB (Title?) | Lorea Garcia San Martin, Sébastien Villaume, Pawel ?  |
| 14:30 | Main   | Implementing CF semantics in BUFR | Mariajana Crepulja (TBC)|
| 15:00 | Main   | Coffee break / screen break |  |
| 15:30 | Main   | World Meteorological Organization CF-NetCDF profiles and governance | David I. Berry, Kevin O'Brien, Bibraj Raj, ??more authors? |
| 16:00 | Main   | GeoZarr and CF | Max Jones (TBC) |
| 16:30 | Main   | Implementing CF semantics in Zarr | Patrick van Laake |
| 17:00 | Main   | Discussion of mappings | |
| 17:30 |       | Adjorn |  |

### Day 3 - Wednesday, 23 September 2026

{: .agenda .table .table-bordered .table-striped}
| Local Time (Bonn)   | Room   | Session  | Presenter/Chair   |
|:-------------|:-------|:-----------------------------------------------------|:----------------------------------------------|
| 09:00 | Main   | Coffee and welcome |   |
| 09:30 | Main | Introduction to today's breakout sessions | |
| 09:40 |      | Breakouts / Hackathons | |
|       | Room? | Houskeeping | ?? |
|       | Room? | Standard names for chemical species | Lorea Garcia San Martin |
| 10:30 | Main   | Coffee break / screen break |  |
| 11:00 | Main   | Copernicus | Chris Goddard (Has this been confirmed???) |
| 11:30 | Main   | Plenary - open time slot!!!! | |
| 12:00 | Main   | CMIP and CORDEX interactinos and use of CF Conventions | Paul Smith (CMIP IPO) |
| 12:30 |        | Lunch break |  |
| 14:00 | Main   | WMO Cloud-optimized future data infrastructure | Jeremy Tandy |
| 14:30 | Main   | Plenary - open time slot!!!! | |
| 15:00 | Main   | Coffee break / screen break |  |
| 15:30 | Main   | CF Checkers | IOOS (needs confirmation) + Sadie |
| 16:00 | Main | Introduction to today's breakout sessions | |
| 16:10 |      | Breakouts / Hackathons | |
|       | Room? | Separating CF semantics from netCDF encoding | Patrick van Laake |
|       | Room? | Support localization of attribute/variable values | Erin Turnbull & ??? |
| 17:30 |       | Adjorn |  |

### Day 4 - Thursday, 24 September 2026

{: .agenda .table .table-bordered .table-striped}
| Local Time (Bonn)   | Room   | Session  | Presenter/Chair   |
|:-------------|:-------|:-----------------------------------------------------|:----------------------------------------------|
| 09:00 | Main   | Coffee and welcome |   |
| 09:30 | Main   | Breakout reports |  |
| 10:30 | Main   | Coffee break / screen break |  |
| 11:00 | Main   | Wrap-up and Meeting Conclusions |   |
| 12:30 |        | Adjorn and Lunch |  |
