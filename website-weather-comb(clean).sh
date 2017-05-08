#Gordon Moseley
#Weather Comb
#May 2017
#You must download "lynx" to use this script.
#
#Sometimes the "11212:4:US"  portion will differ visit weather.com and adjust accordingly.
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#!/bin/bash
clear;
echo "Fetching data, please wait . . ."
sleep 3;
clear
location="11212:4:US ";

area=$(lynx https://weather.com/weather/today/l/${location}-dump -nolist|
 sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'|
 sed 's/* Radar//'|sed -e '1,4d;13d;9d;17d;18d'|sed 's/\^°/°F/g'|
 sed 's/as of/UPDATED: /'|sed -n 1p|sed -e 's/^[ \t]*//');
weather=$(lynx https://weather.com/weather/today/l/${location}-dump -nolist| sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'| sed 's/* Radar//'|sed -e '1,4d;13d;9d;17d;18d'|sed 's/\^°/°F/g'|sed 's/as of//'|sed -n 4p|sed -e 's/^[ \t]*//');
highlow=$(lynx https://weather.com/weather/today/l/${location}-dump -nolist| sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'| sed 's/* Radar//'|sed -e '1,4d;13d;9d;17d;18d'|sed 's/\^°/°F/g'|sed -n 6p|sed -e 's/^[ \t]*//');
feelsLike=$(lynx https://weather.com/weather/today/l/${location}-dump -nolist| sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'| sed 's/* Radar//'|sed -e '1,4d;13d;9d;17d;18d'|sed 's/\^°/°F/g'|sed 's/Feels Like //'|sed -n 5p|sed -e 's/^[ \t]*//');
humidity=$(lynx https://weather.com/weather/today/l/${location}-dump -nolist| sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'| sed 's/* Radar//'|sed -e '1,4d;13d;9d;17d;18d'|sed 's/\^°/°F/g'|sed 's/Humidity  //'|sed -n 11p|sed -e 's/^[ \t]*//');
UV=$(lynx https://weather.com/weather/today/l/${location}-dump -nolist| sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'| sed 's/* Radar//'|sed -e '1,4d;13d;9d;17d;18d'|sed 's/\^°/°F/g'|sed 's/UV Index //'|sed -n 7p|sed -e 's/^[ \t]*//');
updated=$(lynx https://weather.com/weather/today/l/${location}-dump -nolist| sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'| sed 's/* Radar//'|sed -e '1,4d;13d;9d;17d;18d'|sed 's/\^°/°F/g'|sed 's/as of//'|sed -n 3p|sed -e 's/^[ \t]*//');

echo "Current Weather Statistics";
echo "";
echo "	Location . . . . . . . . . . . . : $area";
echo "	Temperature. . . . . . . . . . . : $weather";
echo "	High/Low . . . . . . . . . . . . : $highlow"
echo "	Feels like . . . . . . . . . . . : $feelsLike";
echo "	Humidity . . . . . . . . . . . . : $humidity";
echo "	UV Index . . . . . . . . . . . . : $UV";
echo "	Updated. . . . . . . . . . . . . : $updated";

echo "";
