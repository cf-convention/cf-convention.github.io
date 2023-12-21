# Infrastructure Guide

This guide serves as an advanced version of the contributing documentation
and contains the information on how we manage the infrastructure
behind the CF Website, Conventions document, CF Standard Names table,
and standardized region list.

## CF Website

The [CF Website](http://cfconventions.org) is served by GitHub Pages
from source documents (in Markdown mainly) on the `master` branch
of the [CF Website repo](https://github.com/cf-convention/cf-convention.github.io).
The CF Website pages are regenerated automatically by GitHub Pages
whenever a commit is made to the `master` branch.

### PR Testing for the CF Website

PRs to the CF website repo are built/tested by GitHub Actions
using Jekyll with the 'github-pages' plugin.
The resulting website content is available as an artifact
from the CF Website repo's GitHub Actions [page](https://github.com/cf-convention/cf-convention.github.io/actions) 
for the build of that PR.

Configuration files are:
- [`check_jekyll_build.yml`](https://github.com/cf-convention/cf-convention.github.io/blob/master/.github/workflows/check_jekyll_build.yml)
- [`Gemfile`](https://github.com/cf-convention/cf-convention.github.io/blob/master/Gemfile)
- [`_config.yml`](https://github.com/cf-convention/cf-convention.github.io/blob/master/_config.yml)

## CF Conventions Document
The CF Conventions Document is built from source documents (in AsciiDoc)
on the `master` branch of the [CF Conventions repo](https://github.com/cf-convention/cf-conventions).

### Draft Version - Including all Accepted Proposals 
For each commit to the `master` branch of the CF Conventions repo,
[Travis](https://travis-ci.org) builds the CF Conventions document(s)
using [Asciidoctor](https://asciidoctor.org/).
The resulting HTML page and PDF document are pushed to the `gh-pages` branch
and are served by GitHub Pages at http://cfconventions.org/cf-conventions.
As only accepted proposals and fixes are pushed to master, the resulting documents
are the draft version for the next release.

### Release Versions
??? Also done with Travis? Need to confirm this.

Resulting HTML page and PDF document are pushed to the CF Website Repo
at `/Data/cf-conventions/cf-convention-<version>`
from where they are published to the website
and available at
http://cfconventions.org/Data/cf-conventions/cf-conventions-<version>/cf-conventions.[html|pdf]

GitHub Releases are made ...
?? Should HTML and PDF output be included as assets in GitHub release?

### PR Testing for the CF Conventions Document 
PRs to the CF Convention repo are built/tested by GitHub Actions
using Asciidoctor. The resulting HTML page and PDF document are available
as artifacts in each build on the CF Conventions repo GitHub Actions [page](https://github.com/cf-convention/cf-conventions/actions).

The configuration file for this GitHub Action is:
- [`check_adoc_build.yml`](https://github.com/cf-convention/cf-conventions/blob/master/.github/workflows/check_adoc_build.yml)

## CF Standard Names Table
New CF Standard Names are proposed and discussed in issues on the
[CF Discussion repo][cf-discuss].
Discussion of current and past proposed CF Standard Names,
including if and when they are accepted and ready for publication,
are tracked in the [CEDA CF Vocabulary Editor](http://cfeditor.ceda.ac.uk/proposals/1).

When a new version of the CF Standard Names table is ready for release,
the CF Vocabulary Editor system is used to produces an XML file
that conforms to the schema used for the standard name table
(see Appendix B of the CF conventions).
An XSLT script is then used to render the XML into an HTML version of the Standard Names table.
Another process is run (see [below for details](#kwic-index)) to generate the HTML that is
the KWIC Index version of the Standard Names table.
The XML and HTML files are pushed to the [GitHub Website repo](https://github.com/cf-convention/cf-convention.github.io)
in `Data/cf-standard-name/<version>/[build|src]` so they are published (as described above) to the CF website.

The CF Standard Names process is managed and led by @japamment and @feggleton.
For questions, please uses issues on the [CF Discussion repo][cf-discuss].

### Publishing to NERC Vocabulary Server
The [CF Standard Names vocabulary](http://vocab.nerc.ac.uk/collection/P07/current/)
on the [NERC Vocabulary Server (NVS)](http://vocab.nerc.ac.uk/)
is updated at the same time the CF Standard Names table is updated on the CF website.

For each CF Standard Names table release, the CEDA Vocabulary Editor
also produces a tab separated file suitable for uploading to the NVS.
The NVS runs the new CF Standard Name table through some checking scripts
and then publishes them overnight (many thanks are due to our BODC colleagues,
especially Gwen Moncoiffe and Alexandra Kokkinaki for this part of the process).

### KWIC Index

The KWIC Index version of standard names is produced by first running a Unix shell script
to do some simple text editing on the XML file,
then feeding the result into a Prolog program
contributed by Robert Meutzelfeldt from the University of Edinburgh.
(This is done manually and is not part of the CEDA vocab editor).
The process generates the KWIC Index as an HTML file.

## CF Standardized Region List 

??

[cf-discuss]: https://github.com/cf-convention/discuss