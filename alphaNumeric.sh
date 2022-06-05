#!/bin/sh
#Numbe validator

validAlphaNum()
{
#eturns 0 if all upper+lower+digits, 1 otherwise

#emove all unacceptable characters
compessed=$(echo $1 | sed -e 's/[^[:alnum:]]//g')"

if [ "$compessed" != "$input" ]; then
eturn 1
else
eturn 0
fi
}

echo -n "Ente input: "
ead input

if ! validAlphaNum "$input"; then
echo "You input must consit of only letters and numbers." >&2
exit 1
else
echo "Input is valid"
fi
exit 0;