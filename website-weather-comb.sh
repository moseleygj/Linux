#!/bin/bash
#Gordon Moseley
#weather-comb
#purpose:Combs through weather website to extract only important info in text-based format
#reason: Simplicity


# "USNY0996:1:US" is going to need to be changed according to the users current location which can be done easily by going to the website
# then changeing that portin to the location that represents them.


#Starts from the end of :  "© 2017 The Weather Company, LLC"
#                   To(ends with):  " * Radar"

clear;
lynx https://weather.com/weather/today/l/USNY0996:1:US -dump -nolist|sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'| sed 's/* Radar//'|sed -e '1,4d;9d;17d;18d'
