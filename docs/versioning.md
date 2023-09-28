# Version Control

## Basic Concepts

### History

A Git repository keeps a record of all versions of every file in the project in 
series of snapshots called *commits*. It is up to users to decide whether they
want to commit the project to the repository after each of many tiny changes
or only after long periods of editing involving many files. The choice depends
on how the team works and the nature of the project.

The *history* of a project is a list of *commit* actions with each commit 
representing a stage in the development of the project.

### Origin Repository

The origin repository is the definitive record of the history of the project
which a team of people agree to use.

### Local Repository - cloning

Often projects require a build process which uses software to process file
in the project to produce some kind of output. This is best done on a team
member's own computer. A tool like GitHub Desktop can be used to *clone* the 
origin repository to the local hard disk. This copies the entire *history*
of commits.

A local repository is different to the origin repository because it not
only contains the history of the project but also a working copy of all
the files in their designated structure of directories. When you
*clone* the origin the working copy will correspond to the most recent
*commit*.

A local repository may get out of sync. with the origin and GitHub Desktop
helps you keep up to date. Using *fetch* gets your history up to date with
the origin. Using *pull* does that too but will also update the working
copies to the new latest commit.

### Uncommitted Local Changes

If you edit one or more files in your working copy and go to GitHub Desktop
it will show you a list of the edited files and for text files will show
the edits within the files. You can work on editing the files over time
rebuilding the project periodically until you are ready to share your
changes with team members.

### Committing

When you have a set of edits that you want to share with the team you
first commit them to your own local repository which means inserting
them into the history of commits.

In GitHub you review the changed files, type a summary in the summary
box that communicates the nature of the commit to colleagues, optionally
add a longer description and press the *commit* button.  Your working
copy remains the same but the changes are commited to your local history
of commits.

Commit can cope with edited files, new files, deleting and renaming files.
For files that are plain text only the changed portions of the files
are recorded and for binary files the whole of the changed file is recorded.

### Pushing

After a local commit you have a version that you personally can make
use of - for example to revert to if you make further edits - but your
team mates cannot access it. So, now you need to transfer commits to
the origin repository.

First a *fetch* is in order to find out if someone else has edited the
same files and committed them to the origin repository. (If so a slightly
complicated merge operation may be needed.) If no clashes are revealed
.you use the GitHub command *push*.  This looks in your local history for
commits that aren't in the origin and transfers them to the origin.

Teammates can *pull* your changes to their computers.

### Branches

It is possible to create development branches in git repositories. In this
repository there is one branch only named *main*. However in downstream
forks of this repository it is recommended that you also have a branch
named *staging*. When there is more than one branch a team member can
switch between the branches depending on where they are in the workflow.
Specifically, when the work of installating a new customised language pack
on the production server is complete one may need to work in parallel on
bug fixing on production (the main branch) and adapting the change specification
file on staging for the next version of BB Learn (the staging branch).

By switching branches after a commit a team member can easily switch between
working on fixing issues with the current version of BB Learn (main = production) and the next
version of BB Learn (staging). When a new base version developed on staging is installed
on production the staging branch will be merged into the main branch and when
Anthology install a brand new version of BB Learn on staging a new staging branch
can be split off from main again.

