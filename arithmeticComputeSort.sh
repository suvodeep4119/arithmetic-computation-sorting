#!/bin/bash -x

read -p "First input: " a
read -p "Second input:" b
read -p "Third input:" c

compute1=`echo "scale=2; $a+$b*$c" | bc` 
compute2=`echo "scale=2; $a*$b+$c" | bc`
compute3=`echo "scale=2; $c+$a/$b" | bc`
compute4=`echo "scale=2; $(echo $(($a%$b)) )+$c" | bc`

declare -A computes=( ["type1"]="$compute1" ["type2"]="$compute2" ["type3"]="$compute3" ["type4"]="$compute4" )
echo ${!computes[@]}




