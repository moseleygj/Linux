#!/bin/bash
##current=$((`date +"%B %d, %Y%l:%M %p"`))
#current=$(date +%l:%m)
target="11:07"

while [ "$current" != "$target" ]
do
  current=$(date +%l:%M)

  sleep 5;echo "Not quite there yet..."
#  echo $current
echo $current
echo $target
done
cowsay "kaboom!?"
