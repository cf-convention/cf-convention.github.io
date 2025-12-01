---
layout: default
title: 2025-09-08 CF Conventions Committee and Standard Names Committee meeting
---
# 2025-09-08 CF Conventions Committee and Standard Names Committee meeting

## Attendees

Jonathan, David, Luke, Roy, Daniel, Lars, Seth, Fran, Karl, Chris, Alison

## Membership changes

- **Roy**: Announced retirement plans (started with the organization in 2004, remaining available for questions)
- **Ellie**: Submitted resignation due to starting PhD program (time constraints, not lack of interest)

## Rules
- **Consolidated Rules/Contributing Guidelines**: Still pending completion (Jonathan delayed due to work on anomalies and leap seconds) - Issue https://github.com/cf-convention/cf-conventions/issues/369

## Meeting Minutes Publication 
- Current gap in published summaries (last published: 2025-01-27, previous: 2023-09-29)
- Decision needed on format: detailed internal records vs. brief public summaries
- Agreed to explore using LLM (Claude.ai) for summary generation
- Current minutes published at: https://cfconventions.org/Committees/Conventions_and_Standard_Names/committee_meeting_minutes.html

## CF Workshop Preparation (Tuesday 15:10 UTC)

- **Presenter**: TBD
- **Format**: Couple of slides only (time constraints)
- **Possible content:**
  - Noteworthy developments from the past year
  - CF governance structure and community leadership
  - Repository organization (Vocabs, Discussions, cf-conventions)
  - Consensus and change management processes
  - Reminder of different repositories (vocabularies, discussions, cf-conventions)
  - How we agree to changes/consensus/revisiting changes
  - Do folk know how CF is governed? That it's community led, etc.
- **Action Item**: David to start shared slide deck

## Technical Discussion: Lake Variables Standard Names

- Standard names for lake variables requiring new approach to naming conventions: https://github.com/cf-convention/vocabularies/issues/25
- This issue could use aliases, but this is a different type of alias than we’ve used in the past \- i.e. it’s an alternative (synonym, alis that is not deprecated)  
- Aliases are used to deprecate names (better idea, deepened understanding), this is a different concept.   
- Bringing in a new concept (synonym) during a huge transition change is a challenge and may not be a good idea.   
- Could make them aliases, and add a new XML tag to indicate “synonym”. Is that less disruptive …?  
  - This could be confusing (i.e. an alias that is not really an alias\!)  
  - Better to introduce (whenever appropriate \- no or later) the new thing \- synonym  
- To re-purpose aliases “would be a disaster” (as it would confuse downstream applications on what is/isn’t a true deprecation).  
- One physical concept with 3 different names (that can be considered the same for intercomparison purposes \- sea\_water, inland\_water, sea\_or\_inland\_water)  
  - An alias is *not* a separate entry in the table to its parent name.  But we don’t want our new names to be “normal” aliases.  
- Even adding a tag to alias is tricky, as the information needs to propagate through all sorts of systems (CF editor, website, ….)  
- How would you refer to sea water and *not* inland water?:  
  - Uses cell methods with an area type  
  - This proposal is for standard names only \- not area types  
- What do we call an estuary? \- that’s a case where we don’t want to decide\!  
- What do you call a continuous measurement that starts in a lake, goes down a river and out into the ocean?  
  - sea\_or\_inland\_water  
- Are there any use cases where sea\_or\_inland\_water would cause problems, that we can think of?  
- This is similar territory to open sea and sea ice  
- Label "synonym" could be tricky, because it has baggage in the semantics community.  
- Useful discussion, that shows we don’t know yet how to technically implement the agreed solution.  
  - Need to minimise headaches to the maximum number of people\!  
- JMG to post on issue that the principle is agreed, but the implementation requires further technical discussion possible off-line working group …)


- Description
  - Need for alternative names (synonyms) that differ from traditional deprecated aliases
  - Three related concepts: sea_water, inland_water, sea_or_inland_water
  - Traditional aliases indicate deprecation; this case requires non-deprecated alternatives
- Technical Considerations
  -  Adding synonym concept during major transition may be problematic
  - **Downstream Impact**: Re-purposing aliases could confuse applications expecting deprecation signals
  - **XML Structure**: Adding synonym tags requires propagation through multiple systems (CF editor, website, etc.)
  - **Estuary Classification**: Deliberately ambiguous cases where precise categorization isn't desired
  - **Continuous Measurements**: Scenarios crossing multiple water body types (lake → river → ocean)
  - **Comparison**: Similar to existing sea ice vs. open sea distinctions
- Decision:
  - **Principle**: Agreed in concept
  - **Implementation**: Requires further technical discussion, possibly in an off-line working group 
  - **Next Steps**: Jonathan to post on issue confirming agreed principle while noting need for technical working group to resolve implementation details
- **Info Management Committee**: Thursday (can raise Zenodo and related infrastructure topics)
- **Governance Panel**: Thursday meeting scheduled

## Action Items
1. **David**: Create shared slide deck for CF workshop presentation
2. **Jonathan**: Post on GitHub issue https://github.com/cf-convention/vocabularies/issues/255 regarding agreed principle and need for technical implementation discussion
3. **Committee**: Determine CF workshop presenter
4. **Committee**: Review and approve LLM-generated meeting summaries before publication
5. **Jonathan**: Complete consolidated rules/contributing guidelines when time permits