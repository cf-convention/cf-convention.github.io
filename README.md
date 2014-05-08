cf-convention.github.io
==========================

###CF Metadata
####NetCDF Climate and Forecast (CF) Metadata Convention

The conventions for climate and forecast (CF) metadata are designed to promote the processing and sharing of files created with the NetCDF API. The CF conventions are increasingly gaining acceptance and have been adopted by a number of projects and groups as a primary standard. The conventions define metadata that provide a definitive description of what the data in each variable represents, and the spatial and temporal properties of the data. This enables users of data from different sources to decide which quantities are comparable, and facilitates building applications with powerful extraction, regridding, and display capabilities.     

The CF conventions generalize and extend the COARDS conventions.     

Discussion about CF Metadata takes place in two formats:
* CF Metadata Trac, and
* cf-metadata mailing list.

###Contrubuting
first install jekyll and ruby gem plugin

    sudo apt-get install ruby ruby-gem // for ubuntu
    sudo brew install ruby ruby-gem  // for mac
    gem install jekyll

next update following the above instructions

    cd ~/Projects/cf-convention/cf-document/cf-standard-names/
    vim cf-standard-names-table-26.html
    
Make file corrections

    git commit -am "MBH: adding in updates to cfsn 26"
    git push
    cd ../../cf-convention.github.io/documents
    git pull
    cd ../
    vim 26.md

all Jekyll pages have the same header and this syntax to include a file

    ---
    layout: default
    title: 26
    ---

    {% include documents/cf-standard-names/cf-standard-name-table-26.html %}

Save and close, then test

    jekyll build

If all looks good commit the changes and the site will update

    git commit -am "MBH: add cf-document standard names table 26 to site"
    git push
