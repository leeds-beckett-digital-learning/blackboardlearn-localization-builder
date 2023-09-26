# XML syntax

There are tons of pages of information about XML on the Internet. This page is intended to contain the absolute
minimum of information required by editors of our text change specification file.

## What is XML

A plain text file that contains text which is *marked up* with tags. The tags are used to provide
specific structure.

An XML file may conform with a schema that defines what tags are allowed and where they can be placed.
Different uses for XML use different schemas (also known as document types.)

## The starting line

Will look something like this:

    <?xml version="1.0"?>

Don't fiddle with it.

## What are 'tags'

Markup consists of 'tags' which are indicated using angle brackets, Like this:

    <thingy><special></special></thingy>

Here `<thingy>` is a start tag; `<special>` is also a start tag; `</special>` 
and `</thingy>` are end tags. The whole of the above is described as a thingy element
and the part from `<special>` to `</special>` is a special element. The special element
is inside the thingy element. Elements represent data objects.

## Empty tags

You can have an empty tag like this:

    <thingy></thing>

If you want to abbreviate this, you can with:

    <thingy/>

These are considered to be identical when processing the file.

## Attributes

While tags build structure, attributes are little bits of text that 
are attached to start tags like this:

    <thingy style="classic" type="plain"></thingy>

The value of the attribute must be in double quotes. While a tag says what the 
element is, the attributes add data to the element.

## Escape sequences

The text in an attribute can use any characters from the Unicode standard BUT
certain characters would cause confusion and ambiguity: < > " ' So, if these
characters need to appear in attribute text they must be 'escaped'.

- If you want `<` in text enter `&lt;` 
- If you want `>` in text enter `&gt;` 
- If you want `"` in text enter `&quot;`
- If you want `'` in text enter `&apos;`

However, this adds the requirement for another escape sequence because you might want
to put an apersand into the text too. So:

- If you want `&` enter `&amp;`

## Text between tags

XML allows text between tags too. For example;

    <paragraph>This is some <italic>human readable</italic> text.</paragraph>

Escapes need to be used here too, using the five escape sequences.

However, this placement of text is not used in our change specification file.

## Comments

It is possible to add text into the file which is not part of the document content
but which is intended to provide human readers with extra information.

A comment can cover multiple lines or just one part of one line.

    <!-- a single line comment -->
    <!--
    Multiple lines of text.
    Can appear in a comment.
    -->

## Allowed structure

Any element cannot overlap with another element - this is not allowed:

    <thingy>Some text <whatsit> which is </thing> in an illegal structure</whatsit>

So you need to close elements with end tags in the right places.

## Indents and new lines

In our file, tabs, spaces and line breaks between tags have no effect on the 
processing. That means they can be used to make the file presentable. Elements
are indented with tabs to make the structure clear.

On the other hand, do not add such characters to the values of attributes because
they would change the processing.

## Document types

An XML file that obeys the basic rules above is called "well formed". However, a particular
application of XML can have rules about which elements are allowed inside which other elements.
With the text change specification file you just need to follow the pattern of the existing
file. You can create a new 'when' element by copying one of the existing when elements and
you can similarly copy and paste 'matches' and 'replace' elements. When you select text for
copy and paste make sure you select whole elements - the selection should have a start tag
at the start and an end tag at the end.
