---
layout: default
title: Rules
---

# Rules for CF Conventions Changes
 
<p>New proposals are to be initiated in github issues using the proposal-change-request template, including verbatim changes proposed to the text of standard document and the conformance document.</p>

A member of the conventions committee, or another suitably qualified person, volunteers to moderate the discussion.
If no-one volunteers, the chairman of the committee will ask someone to do it.

The discussion takes place on GitHub issues and all may participate.

 1. The moderator, if one has volunteered, should be in charge of the discussion and make sure that it is conducted in a fair and organized way;
 2. The moderator may list major points of agreement and contention, and, if appropriate, provide links to key milestones of the discussion in the top issue of a discussion;
 3. Participant's in a discussion are expected to respect and comply with requests from the moderator (e.g. to suspend discussion on one topic until another is resolved or to answer specific questions from the moderator). Such requests from the moderator, with appropriate explanations, should be placed in the flow of the discussion.
 4. The individual acting as moderator may also act as a participant, but should clearly distinguish between the two roles;
 5. The moderator should oversee the implementation of proposed changes which are agreed and close the issue when this process is complete.

It will be helpful if a test netCDF file is provided as early as possible during the discussion.
However, several variants of the proposal may be discussed, and the proposer may not be able to provide test netCDF files for all of them.

When three weeks have passed with no contributions being made, the moderator should attempt to move toward a decision on the proposal by summarising the discussion and indicating the outcome as consensus, near consensus, or not near consensus (see below) on making the proposed change.
Since several versions of the proposal might have been discussed, the summary should make clear which one, if any, would be adopted.
The moderator will then invite further comment on the proposal, as summarised.
If further comments are made i.e. the discussion restarts, this step is repeated.

Once the summary has been made, if the test netCDF file does not yet exist, it must be created (unless the summary suggests the proposal should be rejected).
When three weeks have passed with no contributions following a summary, and providing a test file exists (if appropriate), a decision is reached in one of the following ways:

Consensus: Accept the proposal if there is no outstanding objection, and at least three contributors have expressed support for it, including at least two members of the conventions committee.
If the moderator personally expresses support, he or she can be counted among the supporters.

Near consensus: If the conditions for consensus are not met but the moderator's summary is that consensus has nearly been achieved, accept the proposal if all, or all but one, of the conventions committee vote in favour of it.
The moderator will call for votes and all members should vote.

Not near consensus: No change to standard.

The GitHub issue is then closed by the moderator stating the outcome.

If the change is accepted, the standard document should be updated, the CF convention version number incremented, and the conformance document updated.

The author of the proposal should be added to the list of contributing authors of the CF convention.

If the change, once implemented in the conventions, subsequently turns out to be materially flawed, meaning that data written following the convention could be somehow erroneous or ambiguous, a github issue should urgently be opened to discuss whether to revoke the change.
If this is agreed by a majority of the committee, a new version of the conventions will be prepared immediately, with the second digit of the version number incremented, and will be recommended to be used instead of the flawed version.
The flawed version will be deprecated by a statement in the standard document and the conformance document.
However, any data written with the flawed version will not be invalidated, although it may be problematic for users.
Errors or lack of clarity in wording, when the convention itself is not at fault, can be corrected by defect tickets on the usual schedule.

All versions of the standard and conformance document should be kept available online, with their github issues and a history of changes.

## Additional rules relating to the CF data model

The CF data model will guide the development of CF by providing a framework for ensuring that proposed changes fit into CF in a logical way, rather than just a pragmatic one.

All new proposals will be assessed to see if the new features defined in the proposal map onto the CF data model.

The assessment will be carried out by a member of the conventions  committee or another suitably qualified person.
If no-one volunteers, the chairman of the committee will ask someone to do it.

If the proposal maps onto the existing CF data model then no  modifications to the data model are required.

Otherwise an attempt must be made to modify the proposal so that its  new features do map onto the CF data model, and in such a way that  the proposal's intent is not compromised.

If the proposal cannot be acceptably modified to conform to the existing data model, then the data model will need to be modified to  accommodate the new features.
If the data model may be extended or generalised in some way that allows the new features but does not affect its existing constructs and relationships, the proposal is considered backwards compatible.
This is the preferred solution.

Any changes to the data model must be described verbatim as part of the proposal discussion, including any modified or new data model diagrams.
However, to facilitate the progress of a proposal that requires data model changes, it is sufficient for the general nature of the data model modifications to be identified, on the understanding that the data model text will be updated in detail at a later date, possibly after the proposal has been accepted.

## Additional recommendations relating to UGRID

CF incorporates named versions of the UGRID conventions without redefining them in the CF conventions document, i.e. CF formally refers to the UGRID conventions document for its description of mesh topologies.
UGRID has its own governance that is independent of the rules governing the CF conventions, and it is therefore the joint responsibility of the CF and UGRID communities to ensure that changes to one convention are mutually agreeable to the other.

In the unlikely and highly undesirable event that a non-negotiable change to one convention is incompatible with the other convention then this may be resolved either by restricting which versions of UGRID are allowed in CF; or else (as a last resort) rewriting UGRID into the CF conventions document, including any required compatibility changes, thereby breaking the formal dependence on the external UGRID conventions.
