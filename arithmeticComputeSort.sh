#!/bin/bash -x

read -p "First input: " a
read -p "Second input:" b
read -p "Third input:" c

compute1=`echo "scale=2; $a+$b*$c" | bc` 
compute2=`echo "scale=2; $a*$b+$c" | bc`
compute3=`echo "scale=2; $c+$a/$b" | bc`
compute4=`echo "scale=2; $a%$b+$c" | bc`



