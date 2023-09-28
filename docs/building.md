# Building the language pack

The customised language packs (classic and ultra) are based on the standard language packs.
The project processes files within the base packs to produce the custom ones.
The documentation assumes that the base is en_GB and the customised
pack is en_GB_LBU. 

## When BB Learn is Upgraded

If you have recently downloaded base language packs make sure you have committed
the changes and pushed to GitLab before proceding with a build.

## When You Edit the Customisations

The customisations are all defined in the 
file ./src/changes/lang_property_changes.xml
You can rebuild the customised language pack *before* committing edits to that
file. This allows you to test changes, reverse or correct them until the build
is succesful and only commit when the built language pack is ready to share with
team mates for proof reading.

## How to build

- Open a commnd prompt window. (Start menu - Windows System)
- Change disk drive and directory to the location of your local project repository. Probably like this:

        Microsoft Windows [Version 10.0.19044.3208]
        (c) Microsoft Corporation. All rights reserved.

        P:\>c:

        C:\>cd Users\username\Documents\GitHub\mybeckett-localisation

        C:\Users\username\Documents\GitHub\mybeckett-localisation>

- Type the command;

        ant

This processes files in the `src` subdirectory to produce intermediate files in the `build` directory which are further processed to output files for installation in the `dist` subdirectory.

- Browse the files to see what has been done.
- It really is that simple.

However, never just trust that the build has been successful - examine how the output language pack differs from the input pack it is based on
or check it against the previous build in the proof directory.

## Checking the customised files against the source

This is what you need to do after your first candidate build. Here you need to check your customised files in the build directory
against the original files in the src directory.

### Checking the ultra build

- Run Meld
- Click on the big File button to compare two files.
- Use the browse button under the file button to select the following file;

        C:\Users\yourusername\Documents\GitHub\mybeckett-localisation\src\language\ultra\en_GB\ultra_lang_for_diff.xml

- Use the browse button to the right of the first browse button to select this file;

        C:\Users\yourusername\Documents\GitHub\mybeckett-localisation\build\language\ultra\en_GB_LBU\ultra_lang_for_diff.xml

- Click the big blue Compare button. (It might take some time for the comparison to complete.)
- The base Ultra strings are displayed on the left and the customised ones on the right.
- Use the controls in meld to review all of the many changes.

In the future a different comparison may be made - comparing the build to a previous version of the customised language pack.

### Checking the classic build

- Run Meld
- Click on the big Folder button.
- In box 1 select:

        C:\Users\yourusername\Documents\GitHub\mybeckett-localisation\src\language\classic\en_GB\en_GB

- In box 2 select:

        C:\Users\yourusername\Documents\GitHub\mybeckett-localisation\build\language\classic\en_GB_LBU\en_GB_LBU

You first see the files listed with base files on the left and customised on the right. A white file icon indicates that the files are the same in both folders (although a blue spot is used to indicate files that have a more recent date stamp). Blue file icons are used to indicate where changes have been made.

- Double click on a blue file to open a file comparison Window.
- To fully check the language pack open and check every file that has been changed by the build.

### Collaborating on proof reading

You may wish to edit the change specification file and rebuild several times before you want team mates to
proof read. When you are ready you will...

- Commit your edits to the change specification file and push to the origin.

They will

- Pull the latest version.
- Build.
- Repeat the checking, making notes on issues.

### Recording a proof

If as a team you have issues that need to be resolved by further edits to the change specification file
you need to rebuild but you want to avoid rechecking strings that are not affected by these latest edits.

- At a command line run `ant proof` to copy language files from the build into a proof directory.
- Commit the proof to version control with a title like...

	PROOF 3900.76.0-rel.17+f95a1cd

- Make further edits to the change specification file.
- Check the build against the most recent proof.


### Checking the customised files against the most recent proof

- Run Meld
- Click on the big Folder button.
- In box 1 select:

        C:\Users\yourusername\Documents\GitHub\mybeckett-localisation\proof\language\

- In box 2 select:

        C:\Users\yourusername\Documents\GitHub\mybeckett-localisation\build\language\

This will give you a much shorter number of changes to proof read. When complete you can
once again commit/push the change specification file and separately record the build to the
proof directory and commit/push that.

## The next version of the base language pack

When you start work on the next version of the base language pack (downloaded from your staging service
some days before it is scheduled to be installed on production) you should create a branch in the 
version control named "staging" just in case you need to fix issues on production before the new
version is installed there. Then you can repeat the process of rebuilding and checking the built
files against the most recent proof. You may or may not need to edit the change specification file.

