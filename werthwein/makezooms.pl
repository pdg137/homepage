#!/usr/bin/perl

@nums = ("0", "1-2", "1","2-3", "2", "3", "4", "5", "6-8", "6", "7",
         "8", "9", "10", "11", "12", "13", "14", "13-16", "15","16",
         "17", "18", "19", "20", "21", "22", "23", "24", "25" );

foreach $num (@nums) {
    open FILE, ">$num.html";
    print FILE `cat map.html`;
    print FILE <<END;
<img src="$num.jpg" align="top">
END
    print FILE "<p><b>German transcription:</b> <i>";
    if(-e "$num.de.txt") {
      print FILE `cat $num.de.txt`;
    }
    print FILE "</i></p><p>\n";
    print FILE "<b>English translation:</b> ";
    if(-e "$num.en.txt") {
      print FILE `cat $num.en.txt`;
    }
    print FILE "</p>\n";
    if(-e "$num.extra.html") {
      print FILE "<p>\n";
      print FILE `cat $num.extra.html`;
      print FILE "</p>\n";
    }
}

open ALL, ">all.html";
print ALL <<END;
<h1>Werthwein Family Tree</h1>
[<a href="index.html">Clickable tree</a>]
[<a href="http://www.math.uiuc.edu/~dan/Werthwein/">More information from Dan</a>]
<p>
This is a translation of the Werthwein family tree chart, written in
German in the old cursive script, in the possession of Phyllis Ream,
by Dan and Paul Grayson.  Dan has gone to the local Mormon genealogical
library and ordered the microfilms for Knittlingen to confirm the
names and dates provided by the family tree chart; those films are
made from the backup copies in the archives in Stuttgart.  Another
thing we could do is to visit Knittlingen to look at the original
church books.
</p>
<img src="family_tree.halfsize.nums.jpg">
END
foreach $num (@nums) {
    print ALL "<h2><a name=\"$num\"><a href=\"$num.html\">$num";
    print ALL <<END;
 <img src="$num.jpg" align=top></a></h2>
END
    print ALL "<p><b>German transcription:</b> <i>";
    if(-e "$num.de.txt") {
      print ALL `cat $num.de.txt`;
    }
    print ALL "</i></p><p>\n";
    print ALL "<b>English translation:</b> ";
    if(-e "$num.en.txt") {
      print ALL `cat $num.en.txt`;
    }
    print ALL "</p>\n";
    if(-e "$num.extra.html") {
      print ALL "<p>\n";
      print ALL `cat $num.extra.html`;
      print ALL "</p>\n";
    }
}
close ALL;
