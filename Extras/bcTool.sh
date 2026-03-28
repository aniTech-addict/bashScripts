#!/bin/bash

# bash calculator bc
#
# Basic Arithmatic
echo "5+3" | bc

#with variables
a=12345
b=1010
echo "$a * $b" | bc

#modulo
echo "999 % 5" | bc

#decimal division -> need to set scale first
echo "scale=10; 236 / 3" | bc
