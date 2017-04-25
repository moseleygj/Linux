#!/bin/sh
#Number validator

validAlphaNum()
{
#returns 0 if all upper+lower+digits, 1 otherwise

#remove all unacceptable characters
compressed=$(echo $1 | sed -e 's/[^[:alnum:]]//g')"

if [ "$compressed" != "$input" ]; then
return 1
else
return 0
fi
}

echo -n "Enter input: "
read input

if ! validAlphaNum "$input"; then
echo "Your input must consit of only letters and numbers." >&2
exit 1
else
echo "Input is valid"
fi
exit 0;