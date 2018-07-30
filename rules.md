---
layout: default
title: Rules
---

# Rules for CF Conventions Changes
 
<p>New proposals are to be made in github issues using the template, including verbatim changes proposed to the text of standard document and the conformance document.</p>

<p>A member of the conventions committee, or another suitably qualified person, volunteers to moderate the discussion. If no-one volunteers, the chairman of the committee will ask someone to do it.</p>

<p>The discussion takes place on github issues and all may participate.</p>

<p>The moderator periodically summarises discussion on github, keeps it moving forward and tries to achieve a consensus. It is expected that everyone with an interest will contribute to the discussion and to achieving a consensus during this stage. During the discussion, if an objection is raised, answered and not reasserted, the moderator will assume the objection has been dropped. However, since consensus is the best outcome, it will be helpful if anyone who expresses an objection explicitly withdraws it on changing their mind or deciding to accept the majority view.</p>

<p>The moderator is encouraged to organize conference calls and/or webex-type interactions if this might help resolve an issue more quickly.</p>

<p>It will be helpful if a test netCDF file is provided as early as possible during the discussion. However, several variants of the proposal may be discussed, and the proposer may not be able to provide test netCDF files for all of them.</p>

<p>When three weeks have passed with no contributions being made, the moderator should attempt to move toward a decision on the proposal by summarising the discussion and indicating the outcome as consensus, near consensus, or not near consensus (see below) on making the proposed change. Since several versions of the proposal might have been discussed, the summary should make clear which one, if any, would be adopted. The moderator will then invite further comment on the proposal, as summarised. If further comments are made i.e. the discussion restarts, this step is repeated.</p>

<p>Once the summary has been made, if the test netCDF file does not yet exist, it must be created (unless the summary suggests the proposal should be rejected). When three weeks have passed with no contributions following a summary, and providing a test file exists (if appropriate), a decision is reached in one of the following ways:</p>

<p>Consensus: Accept the proposal if there is no outstanding objection, and at least three contributors have expressed support for it, including at least two members of the conventions committee. If the moderator personally expresses support, he or she can be counted among the supporters.</p>

<p>Near consensus: If the conditions for consensus are not met but the moderator's summary is that consensus has nearly been achieved, accept the proposal if all, or all but one, of the conventions committee vote in favour of it. The moderator will call for votes and all members should vote.</p>

<p>Not near consensus: No change to standard.</p>

<p>The github issue is then closed by the moderator stating the outcome.</p>

<p>If the change is accepted, the standard document should be updated, the CF convention version number incremented, and the conformance document updated.</p>

<p>The author of the proposal should be added to the list of contributing authors of the CF convention.</p>

<p>If the change, once implemented in the conventions, subsequently turns out to be materially flawed, meaning that data written following the convention could be somehow erroneous or ambiguous, a github issue should urgently be opened to discuss whether to revoke the change. If this is agreed by a majority of the committee, a new version of the conventions will be prepared immediately, with the second digit of the version number incremented, and will be recommended to be used instead of the flawed version. The flawed version will be deprecated by a statement in the standard document and the conformance document. However, any data written with the flawed version will not be invalidated, although it may be problematic for users. Errors or lack of clarity in wording, when the convention itself is not at fault, can be corrected by defect tickets on the usual schedule.</p>

<p>All versions of the standard and conformance document should be kept available online, with their github issues and a history of changes.</p>
