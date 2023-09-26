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
is succesful and only commit when the built language packs are what you want.

## How to build

- Open a commnd prompt window. (Start menu - Windows System)
- Change disk drive and directory to the location of your local project repository. Probably like this:

        Microsoft Windows [Version 10.0.19044.3208]
        (c) Microsoft Corporation. All rights reserved.

        P:\>c:

        C:\>cd Users\maber01\Documents\GitHub\mybeckett-localisation

        C:\Users\maber01\Documents\GitHub\mybeckett-localisation>

- Type the command;

        ant

This processes files in the `src` subdirectory to product intermediate files in the `build` directory which are further processed to output files for installation in the `dist` subdirectory.

- Browse the files to see what has been done.

## Checking the customised files

Never just trust that the build has been successful - examine how the output language pack differs from the input pack it is based on.

## Checking the ultra build

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

## Checking the classic build

- Run Meld
- Click on the big Folder button.
- In box 1 select:

        C:\Users\yourusername\Documents\GitHub\mybeckett-localisation\src\language\classic\en_GB\en_GB

- In box 2 select:

        C:\Users\yourusername\Documents\GitHub\mybeckett-localisation\build\language\classic\en_GB_LBU\en_GB_LBU

You first see the files listed with base files on the left and customised on the right. A white file icon indicates that the files are the same in both folders (although a blue spot is used to indicate files that have a more recent date stamp). Blue file icons are used to indicate where changes have been made.

- Double click on a blue file to open a file comparison Window.
- To fully check the language pack open and check every file that has been changed by the build.