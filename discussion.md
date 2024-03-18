---
layout: default
title: Discussion
group: "navigation"
---

# Discussion

CF is carrying out a trial (beginning in March 2024) of using the CF [GitHub organization Discussions][github_discussions] for announcements relevant to CF, community discussion of comments and ideas for changing CF, and for questions and answers about how to use CF.

Announcements, discussions and Q&A that were initiated _before_ the trial of CF GitHub Discussions began are continuing as [GitHub issues][github_issues] in the [`discuss` repository][github_discuss].
 
Proposals for changing CF are discussed as [GitHub issues][github_issues] in three repositories:

*   [Vocabulary][github_discuss]

    For proposing additions or amendments to standard names, their definitions, or other CF controlled vocabulary (area types and standardized regions).

    The status of proposals about standard names is shown by the [CEDA vocabulary editor][vocab_editor].
  
*   [Conventions][github_conventions]

    For proposing enhancements and reporting defects in the CF conventions.

    Closed issues: [change agreed][github_conventions_change], [agreement not to change][github_conventions_nochange], [dormant][github_conventions_dormant] i.e. the discussion on a proposed change did not reach a conclusion. Dormant issues may be reopened if there is a new impetus or ideas that might help bring about an agreement.

*   [Website and governance][github_website]

    For discussing, proposing changes and reporting defects in the [CF website][website] or CF governance.

No registration with CF is required to contribute; all that is needed is a freely available [GitHub account][github].

Before the CF community migrated to GitHub, general and standard-name discussion took place on the [cf-metadata mailing list][archives], and enhancements to the conventions were proposed on the [CF Metadata Trac](Data/trac.html) site.

### Archive links

* cf-metadata mailing list archive [copy on GitHub][archives] or [original at NCAR][NCAR_archives] (until December 2019)
* To see a list of resolved proposals (accepted or rejected) for standard names from March 2011 onwards, click "Inactive" in the [CEDA vocabulary editor][vocab_editor]
* [CF Metadata Trac](Data/trac.html) (until July 2018)
* [About CF Metadata Trac][about]

[github_discuss]: https://github.com/cf-convention/discuss/issues
[github_conventions]: https://github.com/cf-convention/cf-conventions/issues
[github_conventions_change]: [github_conventions]?q=is:issue+label:"change agreed"
[github_conventions_nochange]: [github_conventions]?q=is:issue+label:"agreement not to change"
[github_conventions_dormant]: [github_conventions]?q=is:issue+label:dormant
[github_website]: https://github.com/cf-convention/cf-convention.github.io/issues
[github]: https://github.com
[website]: https://cfconventions.org
[trac]: Data/trac.html
[about]: about-trac.md
[mail]: http://mailman.cgd.ucar.edu/mailman/listinfo/cf-metadata
[archives]: https://cfconventions.org/mailing-list-archive/Data/
[NCAR_archives]: https://mailman.cgd.ucar.edu/pipermail/cf-metadata/
[current]: https://cfeditor.ceda.ac.uk/proposals/1
[vocab_editor]: https://cfeditor.ceda.ac.uk/proposals/1
[github_issues]: https://guides.github.com/features/issues
[github_discussions]: https://github.com/orgs/cf-convention/discussions
