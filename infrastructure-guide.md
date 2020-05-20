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

For each commit to the `master` branch of the CF Conventions repo,
[Travis](https://travis-ci.org) builds the CF Conventions document(s)
using [Asciidoctor](https://asciidoctor.org/).
The resulting HTML page and PDF document are pushed to the `gh-pages` branch
and are served by GitHub Pages.
They are available at http://cfconventions.org/cf-conventions

### Release Versions
??? Also done with Travis?

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
New CF Standard Names are discussed and proposed in issues on the [CF Discussion repo](https://github.com/cf-convention/discuss).
Proposed CF Standard Names are tracked in the [CEDA CF Standard Name Tracker](http://cfeditor.ceda.ac.uk/proposals/1).

New versions of the CF Standard Name table are released ?monthly or quarterly?
with any newly accepted standard names.
The new XML file and XSLT-generated HTML file are pushed to the CF Website repo
in `Data/cf-standard-name/<version>/[build|src]`.

## CF Standardized Region List 

??
