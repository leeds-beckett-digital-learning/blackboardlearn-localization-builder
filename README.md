# MyBeckett Localisation

*Please note that although the files in this GitHub repository are licensed
under the Apache 2.0 open source software license, the files that make up a
blackboard learn language pack are proprietory content belonging to Anthology.
Take care not to allow their language pack files to escape into public space.*

## This Documentation ##

This documentation was forked from an internal repository intended for
our own team members. It has not yet been fully generalised for use by other
organisations - work on that is in progress..

## Introduction

A project to process a standard blackboard learn language pack and customise it
based on a single, simple specification file that defines changes that need to
be made.

Processes both classic and ultra strings.

## Forking ##

It is recommended that you clone this repository to a private location and
add the downloaded classic and ultra language packs into it. A
secure and private location is required because the language packs are 
copyright of Anthology. Any team members that work with the repository
need to be aware of Anthology's licensing agreement and take care not to
breach it by moving those files into a public space.

Some advice on how to fork a GitHub project to another host (e.g. your
own private and secure installation of GitLab) can be found on this
stackoverflow page [fork-between-github-and-gitlab-projects](https://stackoverflow.com/questions/45129950/fork-between-github-and-gitlab-projects).
This will help you maintain a link from team member's clones of your project to
both our upstream repository and your origin repository.

Your first task after cloning this repository will be to download your
current language packs from your BB Learn staging service. See instructions
below.

A short sample change specification file is included at ./src/changes/lang_property_changes.xml
and your second task will be to edit it to reflect your own policy for localisations.
The sample is not currently synchronized with LBU's file. We may release that at a later
date if others find it useful.


## Overview

- We stop editing strings in the BB Learn user interface because this puts the
definitive record of our decisions into a scattered collection of files which
are ultimately beyond our control and are not 'versioned'.
- All definitions of our customisations will go into a single reasonably short
change specification file.
- The change specification file will be kept in a version control system.
- A complete record of all edits of the change specification file will be 
kept in git repository format.
- Team members will have simple access to view and edit the change specification
file directly within the version control repository using a web browser.
- In two circumstances the custom language pack (both classic and ultra strings)
will be rebuilt by a team member.
    1. Every time Anthology releases a new version of BB Learn.
    2. Whenever we decide to change terminology or for any other reason we complete
    a series of edits to the change specification file.
- A team member will build the language pack, working on a copy of the git
repository, using a single command in the windows command prompt.
- After rebuilding the language pack a file comparison tool must be used to
check that no problems have popped up. The first build will involve many hours
of proof reading but proof reading following each new version of BB Learn will take
one person about 30 minutes to complete.
- After checking and perhaps adjustments/rebuilding the language pack can be
installed in two stages - for classic and ultra.

## Instructions for Editors

For team members who edit the change specification file no software needs to 
be installed on their computers. All work can be done from their own computer
using a web browser.

It is necessary to understand the format/structure of the change specification 
file. That file is largely self documented but some basic understanding of
the concept of [well formed](docs/xml.md) with respect to the XML file specification.
However, the editors in web based git repositories provide colour coding of file elements such
that accidental breaking of "well formed" syntax will usually cause instant
changes of colour that highlight the issue.

It is also important to understand how the file will be processed when
the language pack is built. Comments within the file itself explain this.

## Prequisites for Building

The [prerequisites page](docs/prerequisites.md) documents how to download
and install software tools that are needed to build the customised language pack.
This is complete and tested on a typical Windows PC. If you need to use a Linux
or Apple operating system you might need to use alternate tools and/or use
differing instructions for isntallation and configuration.

## Fetching base language packs

When Anthology update Blackboard Learn they will add and remove strings
from the language packs and change the content of existing strings. These
need to be downloaded and committed to the local and central repositories
using a git tool.

Only one team member needs to do this.

Before this task is completed you need to check that you don't have any
local uncommited edits. Then make sure you are
synchronised with the origin server with fetch and if necessary pull.

[Notes on downloading Ultra language pack.](docs/ultra.md)

[Notes on downloading Classic language pack.](docs/classic.md)

After downloading both the ultra and classic language files and importing the
Ultra file, use your git tool to commit using a commit summary containing
the BB Learn version, release and build numbers like this:

    NEW SOURCE 3900.74.0-rel.3+fa39cb9

After commiting locally use your git tool to push the commit to the origin server.
Then other team members can use GitHub Desktop to fetch followed by pull to bring 
their own copies of the repository up to date.

## Version control

It is crucial to keep track of changes to the files in the project. There are
four kinds of changes,

1. Base language pack files are changed by Anthology with new releases of BB Learn.
2. The text change specification file will need to be edited to implement local terminology changes
and may also need to be edited in response to changes in the base files that cause problems.
3. As a part of the workflow the language files are copied to a 'proof' directory so they are
available for comparison when rebuilding.
4. Hopefully less frequently, it may be necessary to debug and edit the other files in the
project that process the language pack files. (E.g. the build.xml file and XSLT transforms.)
You may like to make a pull request so these changes can be incorporated into this upstream
repository.

Instructions on what commands to use in GitHub Desktop to manage versions are 
included in the appropriate places in the documentation but some basic concepts
and specifics about git and GitHub Desktop are described in this [version control page](docs/versioning.md)

## Building

Go to [build documentation](docs/building.md)

