## CF Trac Website

This page is an archive copy, kept only for historical interest, of information about the former [CF Metadata Trac](Data/trac.html) site, which itself also is now kept only as an archive.
The Trac site was used until July 2018 for discussion of enhancements to the CF convention.
New proposals are now [discussed in GitHub](discussion.md).

The following information should be read in the past tense.

## How the Ticket System Works

A Trac ticket is more or less equivalent to a discussion thread.
The ticket system is aligned with a series of email lists corresponding to various thrusts of CF evolution (represented as "components" in Trac).
The biggest change in the new system is that individuals no longer send email directly to the mailing list.
Instead, the Trac system will automatically send email to the appropriate list(s) each time you create or modify a ticket.
The mailing lists are arranged in such a way that you can choose to subscribe to only the discussions of interest to you - or you can subscribe to the parent list and receive an email for every single message post.

In summary, you send messages using the Trac web interface and you receive messages via the mailing lists you subscribe to or by reading the messages in your web browser.

## Joining the Discussion

Spammers have managed to make our lives miserable, and they are getting more sophisticated.
They now even have bots that create spam Trac tickets!
For this reason, each person is required to have an account in Trac to create and modify tickets.
Follow the steps below to get started:

If you ARE already a member of the cf-metadata@cgd.ucar.edu mailing list:
Note: Step 1 is only required if you want to post messages.
If you only want to listen in, you don't have to do anything.

1. Request a Trac account by sending your first name, last name, and preferred username to: webmaster at pcmdi.llnl.gov

As a member of the cf-metadata@cgd.ucar.edu mailing list, you will automatically be subscribed to the new cf-metadata@lists.llnl.gov mailing list.
At a later date, if you wish to limit email traffic to certain aspects of CF discussions, you can unsubscribe yourself from cf-metadata@lists.llnl.gov and subscribe instead to one or more of the sub-lists.

If you ARE NOT already a member of the cf-metadata@cgd.ucar.edu mailing list: 
Note: Step 1 is only required if you want to post messages.
If you only want to listen in, skip to Step 2.

1. Request a Trac account by sending your first name, last name, and preferred username to: webmaster at pcmdi.llnl.gov.
2. Subscribe yourself to the mailing lists you're interested in.
You will automatically be subscribed to the cf-conventions and cf-standard-names mailing lists.
You must independently subscribe to the working group lists.

## Components and Mailing Lists

Component	| Mailing List | Description
--- | --- | ---
N/A | cf-metadata@lists.llnl.gov | Parent list. Subscribe to this list to receive all messages.
cf-checker | cf-checker@lists.llnl.gov | Discussion related to the CF Checker. 
cf-conventions | cf-conventions@lists.llnl.gov |Discussion related to CF Conventions. Proposals to extend the conventions.
cf-standard-names | cf-standard-names@lists.llnl.gov | Discussion related to CF Standard Names. Proposals for new names.
cf-wg-infrastructure | cf-wg-infrastructure@lists.llnl.gov | Website, nuts and bolts of document maintenance.
cf-wg-supporting-technologies | cf-wg-supporting-technologies@lists.llnl.gov | Structured & unstructured grids.
cf-wg-gis | cf-wg-gis@lists.llnl.gov | Relationship between GIS grids and metadata to CF.
cf-wg-name-development | cf-wg-name-development@lists.llnl.gov | Exploring possibilities for CF Standard Name evolution.
cf-wg-netcdf4 | cf-wg-netcdf4@lists.llnl.gov | Understanding relationship between CF and NetCDF4.
cf-wg-in-situ-obs | cf-wg-in-situ-obs@lists.llnl.gov | How to handle in situ observations in CF.
cf-wg-discovery | cf-wg-discovery@lists.llnl.gov | How to include discovery information in CF.
cf-wg-compliance | cf-wg-compliance@lists.llnl.gov | Reference implementations, CF API, CMOR, sample datasets.
 
## Subscribing to the Mailing Lists

To subscribe to any of the above mailing lists, send a message to majordomo@lists.llnl.gov with the following contained in the email body:

    subscribe <list-name>
    end
    where <list-name> is one of the Component names (not the full mailing list name).

For example, to subscribe to cf-wg-gis@lists.llnl.gov:

    subscribe cf-wg-gis
    end

Unsubscribing from the Mailing Lists
Send a message to majordomo@lists.llnl.gov with the following contained in the email body:

    unsubscribe <list-name>
    end

where <list-name> is one of the Component names (not the full mailing list name).

## Posting to the Mailing Lists

Don't send email directly to the mailing lists.
Rather, use the Trac ticketing system, which will automatically send mail to the correct lists.
If you accidentally reply to an email sent by Trac or send mail directly to one of the mailing lists, the message will be delivered to the mailing list maintainer, who will politely remind you to use the Trac system instead.
