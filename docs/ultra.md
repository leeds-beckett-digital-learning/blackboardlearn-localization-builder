# MyBeckett Localisation

## Documentation

Before updating language packs revert or commit any open file edits.

### Downloading the Ultra Language Pack

This functionality has NOT been provided by Blackboard Learn. You can only download
the small number of text strings that you have customised and not the full list with the BB Learn UI. So,
a workaround is needed.

#### Method 1

This method makes us of debug functionality in your web browser.

1. Log into MyBeckett as administrator
2. Navigate to language packs page
3. Find the current customised language pack
4. Click on edit in the Ultra Locale column
5. Switch on developer tools in your browser
6. Reload the page
7. Go to network section of developer tools
8. Use the filter to view only requests for the base ultra language pack (currently "languageStrings")
9. Click on the file
10. In the appropriate panel of the developer tool view the response, i.e. the content of the file
11. Select all and copy to clipboard
12. Use notepad or other editor to open ./src/language/ultra/en_GB/ultra.json, delete all content and paste from clipboard.

After saving the ultra strings but *before* commiting the ultra and classic changes to the repository, run this command from the base directory of your repository:

    ant importultra

This step converts the ultra file into a format that is better for comparing line by line with previous versions.

After updating both the classic and ultra packs commit to the repository. The commit title should be
the full version number of BB Learn.

#### Future Method?

Write some kind of software to fetch the file. (Can't use a simple URL because a customised
HTTP header is required. Maybe some Javascript in an HTML file would do the job?)


