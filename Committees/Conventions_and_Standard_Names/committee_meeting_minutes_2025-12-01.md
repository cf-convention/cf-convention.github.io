---
layout: default
title: 2025-12-01 CF Conventions Committee and Standard Names Committee meeting
---
# 2025-12-01 CF Conventions Committee and Standard Names Committee meeting

## Attendees

Chris, Lars, Fran, Jonathan, David, Luke, Seth, Alison, Karl

*These minutes were drafted by an AI (Gemini 3 Flash) from the in-meeting notes, before being edited by a human.*

## **Schedule and status of CF-1.13 release.**

* **Timeline:** The release of CF-1.13 is scheduled for the period of **December 16–19, 2025**.
* **Content:** Significant updates, including HEALPix, leap seconds, and anomalies, have been successfully incorporated.
* **Standard Names:** Acceptance of the HEALPix standard name is expected within the next week, which will initiate the mandatory 7-day "cooling-off" period required for all standard names before finalization.
* Inclusion of Antonio as an additional author was approved. This action was taken in recognition of significant contributions made to the convention document and the supporting infrastructure.

## **Committee members watching vocabularies (as well as cf-conventions) repositories might help with the backlog of unanswered standard name issues. Could we reinstate the “moderator attention” label to make it obvious which are unanswered?**

* **Label Management:** * The cessation of the “moderator attention” label was investigated. It was found that the relevant GitHub action had been automatically disabled due to 60 days of inactivity on the repository code; this action has since been re-activated.
    * **Timing:** The inactivity threshold for this label was reviewed. A 3-week threshold was adopted to ensure more timely progression of issues.
* **Community Engagement:**
    * "Watching" the vocabulary repository is encouraged to ensure better oversight of ongoing issues.
    * A new Discussion issue is to be created to re-advertise the vocabulary repository to the wider community.
* **Resources and Funding:**
    * **CF Editor:** Resources have been allocated to add new items, with the goal of producing a new standard name table by the end of January 2026.
    * **Funding:** The resourcing of the standard name process is under discussion by the Governance panel. 
    * **Copernicus & CEDA:** Potential funding from Copernicus is being explored, given the high volume of Copernicus-related traffic. It was noted that the primary bottleneck for CEDA is a lack of funding rather than a lack of time.
    * **Acknowledgement:** Methods for acknowledging funders are being considered ([Issue #621](https://github.com/cf-convention/cf-convention.github.io/issues/621)), with options including updates to the website or inclusion within the release documents.

## **Conventions issue 369: Merging procedural documentation.**

* **Status:** No new progress was reported. The consolidation of "Rules for Changes," "Rules for Errors," and "CONTRIBUTING" into a single file remains an ongoing objective.

## **Vocabulary [issue 25](https://github.com/cf-convention/vocabularies/issues/25): sea_and_inland_water standard names.**

* **Conceptual Challenges:** The definition of a universal water term remains under debate.
    * "Water" was deemed too vague, while "water body" was noted as potentially leading to ungainly phrasing.
    * "Terrestrial water" was suggested but noted for its potential to exclude atmospheric or extraterrestrial data.
    * The requirement is for a term signifying "anywhere water" to accommodate data spanning oceans, inland seas, estuaries, and lakes.
* **Technical Implementation:**
    * A massive infrastructure redesign is to be avoided.
    * It was noted that the NERC Vocabulary Server (NVS) allows for multiple terms to be defined as "exactly equivalent," potentially allowing "sea," "lake," and "water body" to coexist.
    * The capacity of the CF Editor to handle bulk uploads (approximately 1,000 names) was confirmed.
* **Outreach:**
    * It was recognized that the hydrological community is currently underrepresented. 
    * **Action:** Contact is to be made with the US National Water Model team to investigate their approach to hydrological variables.
* **Next Steps:** * Conceptual definitions (the meaning of "family" names) will be decoupled from technical implementation discussions on [Issue #25](https://github.com/cf-convention/vocabularies/issues/25).
    * It was recommended that new names only be requested as specifically needed to prevent inconsistencies.

## **Producing the minutes.**

* **AI Assessment:** The efficacy of AI for generating minutes was evaluated. 
* **Findings:** It was found that while AI is useful for templating and summarizing straightforward items, it performed less well on complex technical and scientific debates. Specifically, the summary of the "water body" discussion was found to be inaccurate.
* **Policy:** It was determined that complex items must be manually drafted or heavily edited from original notes rather than relying on AI-generated summaries.

## **Next meeting.**

* **Schedule:** The next meeting is tentatively scheduled for **early March 2026**.
