---
layout: default
title: 2025 CF Workshop
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


# 2025 CF Workshop

The 2025 CF Workshop will be held **virtually** on **22-25 September 2025**.
The meeting will run for three hours on each day, **15:00 to 18:00 UTC**, plus an informal hour at the end of each day.

## How to register

To participate, please [register here](https://forms.gle/UJ6JCiaZzSGndvWu8){:target="_blank"}.

## How to join
Please join each day using the **“Join via Zoom”** button below.

<!-- Placeholder for Zoom link (replace when ready) -->
<!--
The workshop will be held via Zoom.  

**Join via Zoom:** Link will be posted here shortly.  
(Same link for all four days.)
-->
<!-- When the Zoom link is available, remove these block comments -->

[Join via Zoom](https://rediris.zoom.us/j/98145134170){: .btn .btn-primary .btn-lg role="button" target="_blank" rel="noopener"}

**Breakout sessions:** These run **inside the same Zoom meeting**, there are **no separate links**. During hackathon slots, click **Breakout Rooms** in the Zoom toolbar and choose **Room 1/2/3**. You can switch rooms at any time. If you don’t see **Breakout Rooms**, try **More** on the toolbar. If it’s still not visible (e.g., in some browsers), ask in chat and we’ll move you.

### Instructions for participants
- Please connect a few minutes early to allow time for setup.  
- Keep your microphone muted unless speaking.  
- Use the “Raise Hand” feature or the chat to ask questions.  
- When joining, rename yourself using the format: `Full Name (Affiliation, Country)`  
  Example: `Antonio S. Cofiño (IFCA, CSIC-UC, Spain)`  
- **Hackathons:** breakout rooms are **self-assign** within the same Zoom meeting.
- Plenary sessions are intended to be recorded (not guaranteed).  
- Automated captions and transcripts will be available (not guaranteed).  

## Documents

All the presentations and notes for the plenary and breakout sessions will be available in this [Google Drive folder](https://drive.google.com/drive/folders/1-L_wDQHWM9PaKqUD5AtYNFYsUtbOXSV0).

The organizing committee requests that all presentations, in final form, be placed in the [CF Metadata Conventions Zenodo Community](https://zenodo.org/communities/cfconventions) document repository that provides permanence for the document and a DOI. If you are new to Zenodo, see the [Zenodo "Quick Start" page](https://help.zenodo.org/docs/get-started/quickstart/).

## Agenda

### Day 1 - Monday, 22 September 2025 

{: .agenda .table .table-bordered .table-striped}
| Time (UTC)   | Room   | Session                                              | Presenter/Chair                               |
|:-------------|:-------|:-----------------------------------------------------|:----------------------------------------------|
| 15:00--15:10 | Main   | Welcome and Overview of meeting structure            | David Hassell (NCAS / University of Reading)  |
| 15:10--15:40 | Main   | Introduction to CF, what’s going into CF 1.13        |                                               |
|              |        | &emsp;Introduction                                   | Ellie Fisher (CEDA / NCAS)                    |
|              |        | &emsp;CF-1.13                                        | Sadie Bartholomew (NCAS / University of Reading) |
| 15:40--15:55 | Main   | *Science talk:* Experiences using cf-python to standardise outputs from cyclone tracking softwares | Jack Atkinson (ICCS Cambridge)               |
| 15:55--16:10 | Main   | *Science talk:* Evaluating Large Language Models for Standard Names Generation in CF Conventions | Mario Diez Fernandez (University of Cantabria) |
| 16:10--16:25 | Main   | *Screen break / coffee break*                        |                                               |
| 16:25--16:35 | Main   | Introductions to Day 1 hackathons                    | *All hackathon chairs*                        |
| 16:35--18:00 |        | **HACKATHONS (parallel sessions)**                   |                                               |
|              | Room 1 | &emsp;SGRID Conventions                              | Chris Barker                                  |
|              | Room 2 | &emsp;Precipitation-related standard names           | Alison Pamment (NCAS / CEDA)                  |
|              | Room 3 | ~~&emsp;Making energy datasets CF-compliant~~        | Guilherme Castelao                            |
| 18:00--18:45 | Main   | *Social time*                                        |                                               |

### Day 2 - Tuesday, 23 September 2025

{: .agenda .table .table-bordered .table-striped}
| Time (UTC)   | Room   | Session                                              | Presenter/Chair                               |
|:-------------|:-------|:-----------------------------------------------------|:----------------------------------------------|
| 15:00--15:10 | Main   | Intro to Day 2                                       | *TBD*                                         |
| 15:10--15:30 | Main   | Governance updates, round-up of recent developments  | Ethan Davis (NSF Unidata)                     |
| 15:30--15:50 | Main   | *Science talk:* Tools for mapping between NetCDF and GRIB | Adam Jacobs (UK Met Office)              |
| 15:50--16:00 | Main   | Introductions to Day 2 hackathons                    | *All hackathon chairs*                        |
| 16:10--16:25 | Main   | *Screen break / coffee break*                        |                                               |
| 16:25--17:45 |        | **HACKATHONS (parallel sessions)**                   |                                               |
|              | Room 1 | &emsp;Mapping CF Metadata and WMO GRIB2 Metadata     | Sébastien Villaume (ECMWF)                    |
|              | Room 2 | &emsp;Housekeeping -- website maintenance & improvements | *TBD*                                     |
|              | Room 3 | &emsp;(Digital) accessibility of the CF Convention document | Sadie Bartholomew (NCAS / University of Reading) |
| 17:45--18:15 | Main   | Day 1 and Day 2 hackathon wrap-ups                   | *All hackathon chairs*                        |
| 18:15--19:00 | Main   | *Social time*                                        |                                               |

### Day 3 - Wednesday, 24 September 2025

{: .agenda .table .table-bordered .table-striped}
| Time (UTC)   | Room   | Session                                              | Presenter/Chair                               |
|:-------------|:-------|:-----------------------------------------------------|:----------------------------------------------|
| 15:00--15:30 | Main   | Roadmap introduction / recap                         | Luke Marsden (Norwegian Meteorological Institute / University Centre in Svalbard) |
|              |        | &emsp;What is the roadmap?                           |                                               |
|              |        | &emsp;Why do we need it?                             |                                               |
|              |        | &emsp;Which communities are we engaging with?        |                                               |
|              |        | &emsp;What did we do last year?                      |                                               |
| 15:30--15:45 | Main   | Introductions to Day 3 (roadmap) hackathons          | *All hackathon chairs*                        |
| 15:45--17:30 |        | **Roadmap HACKATHONS (parallel sessions)** <br> (includes break 16:45--17:00) |                      |
|              | Room 1 | &emsp;Vocabularies                                   | Alison Pamment                                |
|              | Room 2 | &emsp;Discovery and Provenance metadata              | *TBD*                                         |
|              | Room 3 | &emsp;Example datasets                               | Luke Marsden, Ag Stephens                     |
| 17:30--18:15 | Main   | *Social time*                                        |                                               |

### Day 4 - Thursday, 25 September 2025

{: .agenda .table .table-bordered .table-striped}
| Time (UTC)   | Room   | Session                                              | Presenter/Chair                               |
|:-------------|:-------|:-----------------------------------------------------|:----------------------------------------------|
| 15:00--15:15 | Main   | Introductions to Day 4 (roadmap) hackathons          | *All hackathon chairs*                        |
| 15:15--17:00 |        | **Roadmap HACKATHONS (parallel sessions)** <br> (includes screen break 16.30--16.40) |               |
|              | Room 1 | &emsp;File formats / data model                      | Sadie Bartholomew                             |
|              | Room 2 | &emsp;AI (LLMs)                                      | Ag Stephens                                   |
|              | Room 3 | &emsp;CF tools                                       | David Hassell                                 |
| 17:00--18:00 | Main   | Roadmap hackathons wrap-up and next steps            | *All hackathon chairs*                        |
| 18:00--18:45 | Main   | *Social time*    

## CF Code of Conduct
Participants should review the [CF Code of Conduct](https://github.com/cf-convention/cf-conventions/blob/main/CODE_OF_CONDUCT.md).

## The organising committee
* Alison Pamment
* Antonio S. Cofiño
* Daniel Lee
* David Hassell
* Ellie Fisher
* Ethan Davis
* Guilherme Castelão
* Kevin O'Brien
* Lars Bärring
* Luke Marsden
* Sadie Bartholomew
