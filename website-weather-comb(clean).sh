#!/bin/bash
#Gordon Moseley
#combs weather.com site for weather quickly without the need to go on the  loging in.

clear;
echo "Fetching data, please wait . . ."
sleep 3;
clear

area=$(lynx https://weather.com/weather/today/l/USNY0996:1:US -dump -nolist|
 sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'|
 sed 's/* Radar//'|sed -e '1,4d;13d;9d;17d;18d'|sed 's/\^°/°F/g'|
 sed 's/as of/UPDATED: /'|sed -n 1p|sed -e 's/^[ \t]*//');
updated=$(lynx https://weather.com/weather/today/l/USNY0996:1:US -dump -nolist| sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'| sed 's/* Radar//'|sed -e '1,4d;13d;9d;17d;18d'|sed 's/\^°/°F/g'|sed 's/as of//'|sed -n 3p|sed -e 's/^[ \t]*//');
weather=$(lynx https://weather.com/weather/today/l/USNY0996:1:US -dump -nolist| sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'| sed 's/* Radar//'|sed -e '1,4d;13d;9d;17d;18d'|sed 's/\^°/°F/g'|sed 's/as of//'|sed -n 4p|sed -e 's/^[ \t]*//');
feelsLike=$(lynx https://weather.com/weather/today/l/USNY0996:1:US -dump -nolist| sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'| sed 's/* Radar//'|sed -e '1,4d;13d;9d;17d;18d'|sed 's/\^°/°F/g'|sed 's/Feels Like //'|sed -n 5p|sed -e 's/^[ \t]*//');
highlow=$(lynx https://weather.com/weather/today/l/USNY0996:1:US -dump -nolist| sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'| sed 's/* Radar//'|sed -e '1,4d;13d;9d;17d;18d'|sed 's/\^°/°F/g'|sed 's/Feels Like //'|sed -n 5p|sed -e 's/^[ \t]*//');
UV=$(lynx https://weather.com/weather/today/l/USNY0996:1:US -dump -nolist| sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'| sed 's/* Radar//'|sed -e '1,4d;13d;9d;17d;18d'|sed 's/\^°/°F/g'|sed 's/UV Index //'|sed -n 7p|sed -e 's/^[ \t]*//');
dewPoint=$(lynx https://weather.com/weather/today/l/USNY0996:1:US -dump -nolist| sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'| sed 's/* Radar//'|sed -e '1,4d;13d;9d;17d;18d'|sed 's/\^°/°F/g'|sed 's/Dew Point  //'|sed -n 11p|sed -e 's/^[ \t]*//');
pressure=$(lynx https://weather.com/weather/today/l/USNY0996:1:US -dump -nolist| sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'| sed 's/* Radar//'|sed -e '1,4d;13d;9d;17d;18d'|sed 's/\^°/°F/g'|sed 's/Pressure  //'|sed -n 12p|sed -e 's/^[ \t]*//');
visibility=$(lynx https://weather.com/weather/today/l/USNY0996:1:US -dump -nolist| sed -n '/ LLC/,/Radar/p'|sed 's/© 2017 The Weather Company, LLC//'| sed 's/* Radar//'|sed -e '1,4d;13d;9d;17d;18d'|sed 's/\^°/°F/g'|sed 's/Visibility //'|sed -n 13p|sed -e 's/^[ \t]*//');

echo "Location . . . . . . . . . . . . : $area";
echo "Temperature. . . . . . . . . . . : $weather";
echo "Updated. . . . . . . . . . . . . : $updated";
echo "Feels like . . . . . . . . . . . : $feelsLike";
echo "UV Index . . . . . . . . . . . . : $UV";
echo "Dew Point. . . . . . . . . . . . : $dewPoint";
echo "Pressure . . . . . . . . . . . . : $pressure";
echo "Visibility . . . . . . . . . . . : $visibility";
