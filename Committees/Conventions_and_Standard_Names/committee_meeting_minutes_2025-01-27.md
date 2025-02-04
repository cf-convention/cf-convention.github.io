---
layout: default
title: 2025-01-27 CF Conventions Committee and Standard Names Committee meeting
---
# 2025-01-27 CF Conventions Committee and Standard Names Committee meeting

## Attendees

Jonathan, David, Lars, Seth, Alison, Roy, Fran, Philip, Karl, Luke, Ellie


## Agenda

1. Consolidation and revision of rules
2. Who qualifies to be named in the list of authors?
3. Three-week conventions "cooling off" periods
4. Is one week enough for the final approval of standard names, or should it be three weeks?
5. How we agree changes
6. When we should revisit changes
7. Our relationship to other standards


## Discussion

### Schedule our next meeting

* DECISION: Some time in April 2025.

### 1. Consolidation and revision of rules

* In August 2024 it was suggested  in [issue 369](https://github.com/cf-convention/cf-conventions/issues/369) to consolidate a list of open procedural issues.
* Issue 369 was not discussed in detail, rather we wanted to remind ourselves that the issue exists, and whether we're happy with its current proposed framework.
* DECISION: Issue 369 should be pursued.

### 2. Who qualifies to be named in the list of authors?

* This is relevant to the PR template, and it's not written it down anywhere.
* To date we've added people as authors who've drafted text to enhance the convention.
We have not added people for suggesting improvements or ideas (not text), nor for correcting defects.
* DECISION: The committee has discretion to authorship, but the general rule is that you will have opened an issue and contributed significant text.

### 3. Three-week conventions "cooling off" periods

* At a recent Governance Panel meeting, it was suggested that we could announce the start of three-week conventions "cooling off" periods, as announcements in the discuss repository, for those who don't subscribe to the conventions repository.
As a partial alternative, it was suggested that whenever we fork a conventions issue from a discussion, we should invite people who are interested to be kept informed by mentioning themselves on the issue.
* The right time to bring people's attention is at the transition from discussion to issue (rather than when the issue is concluded), by inviting people to subscribe to the new issue (which you can do without commenting).
* Working practices should be in the FAQ and README.
* Could ask committee members themselves to provide administrative (not scientific) moderation to make all this happen. This might include ensuring that continued discussion happened in the right place (i.e. on the new issue).
* No concrete decision.

### 4. Is one week enough for the final approval of standard names, or should it be three weeks?

* The 1 week period was originally instigated as a compromise, reflecting that standard name discussions are generally shorter and easier than conventions changes.
Wrapping things and publishing in a timely manner is nice and useful for the community.
* With 1 week you can easily get caught out by being on vacation, etc.
Is 2 weeks a better compromise?
* With a longer delay we don't tend to get more comments, so a longer time could seem like a needless delay.
* The risk of missing one person's contribution is relatively low in a standard name discussion. It's unlikely that the new name will be "wrong", and we have means for correcting mistakes.
* DECISION: No change to the current rule.

### 5. How we agree changes

* We do this by consensus.
Our rules show that this does not mean unanimous support (which allows for people who don't mind, or haven't followed, to accept the general decision).
It means absence of objection to the agreed text, plus a requirement for some explicit support.
The only expertise we have to assure quality is our process of discussion.
* We also have a rule that if the discussion reaches an impasse, it can go to a meeting of the committee.
The committee has never yet needed to make decision in this way.
* When a discussion gets very polarised, we should take a step back and appoint a neutral moderator to try to break the impasse.
* DECISION: No change to rules.

### 6. When we should revisit changes

* Recent discussions ([#400](https://github.com/orgs/cf-convention/discussions/400) and [#401](https://github.com/orgs/cf-convention/discussions/401) have suggested alternative ways of doing things that are already in the CF conventions.
* We have a design principle of "a strong preference against introducing any new capability to the conventions when there is already some method that can adequately serve the same purpose (even if a different method would arguably be better than the existing one)", the aim of which is to limit the complexity of CF, and because all previous conventions must continue to be supported for the sake of archived datasets.
* For the existing standard (i.e. CF-1.x), stability is more important than fixing imperfections. Alternative approaches that address imperfections are possibly  a case for CF-2.x.
* It is hard for some communities to get into aspects of CF (particularly standard names) when they are failing to get what they want due to the way things have been done to date. The landscape has changed since 2003, so re-evaluating old decisions is not a bad thing.
* Just saying "we don't do it like that" is not always constructive, especially when it doesn't provide any solutions.
* People often use layers of standards, e.g. netCDF - CF - [SeaDataNet](https://www.seadatanet.org)/[CMIP](https://www.wcrp-climate.org/wgcm-cmip). CF provides the solid foundations on which others can build.
However, such layers are fine only up to the point when what needs to be built on CF needs to modify parts of CF itself.

### 7. Our relationship to other standards

* If CF wants to include something for which there is already a convention, should it be re-implement in a "CF-way", or just say "we follow convention X".
There are pros (e.g. we don't need to reinvent a wheel) and cons (e.g. convention X will certainly evolve, and we have to keep track of that) with both approaches.
* One case where we have done this is with the biological taxa, which defers to a well defined authority.
Another is UDUNITS (following COARDS).
* We should ask ourselves if we can map between other standards (interoperability, sufficiently distinct). This is a separate question as to whether our representation looks exactly like another standard.
* Different standards have different purposes, and you can't be interoperable with every standard. The purpose of CF is to make our data usable, and that trumps interoperability if need be.
* Where does CF end, and other standards begin? So long as we're clear where we are in relation to these things, that's OK. We don't have to represent everything within CF ourselves.
* We should embrace the fact that other communities have often thought about things more deeply than we have, and take advantage of that.
* This sort of question might be well served by forming off-line discussion groups (as has been successful in the past).
* DECISION: We will set up an offline discussion group for the question of interoperability between the CF calendars and OGC/ISO.

