#!/bin/bash

n1=4
n2=20

echo $(( n1 + n2 ))
echo $(( n1 - n2 ))
echo $(( n1 * n2 ))
echo $(( n1 / n2 ))
echo $(( n1 % n2 ))

if (( "$n1" + "$n2" == 24 ))
then
  echo " The sum of 4 and 20 is 24"
fi
