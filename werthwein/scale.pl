#!/usr/bin/perl -p

if(m/(.*coords=")([0-9,]+)(".*)/) { #")
   @coords = split m/,/,$2;
   foreach $coord (@coords) {
     $coord = $coord/2;
   }
   $_ = $1.(join ",",@coords).$3."\n";
}
