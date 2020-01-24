#!/bin/bash -x
count=0

read -p "First input: " a
read -p "Second input:" b
read -p "Third input:" c

compute1=`echo "scale=2; $a+$b*$c" | bc` 
compute2=`echo "scale=2; $a*$b+$c" | bc`
compute3=`echo "scale=2; $c+$a/$b" | bc`
compute4=`echo "scale=2; $(echo $(($a%$b)) )+$c" | bc`

declare -A computes=( ["type1"]="$compute1" ["type2"]="$compute2" ["type3"]="$compute3" ["type4"]="$compute4" )
while [[ $count -ne ${#computes[@]} ]]
do
	array[$count]=${computes[type"$(( count+1 ))"]}
	count=$((count+1))
done
echo ${array[@]}


#Descending
for ((i=0; i<3;i++))
do
	for((j=i+1;j<4;j++))
	do
		if [[ ${array[i]%.*} -lt ${array[j]%.*} ]]
		then
			temp=${array[i]}
			array[i]=${array[j]}
			array[j]=$temp
		fi
	done
done
echo ${array[@]}

#Ascending
for((i=0;i<3;i++))
do
   for((j=i+1;j<4;j++))
   do
      if [[ ${array[i]%.*} -gt ${array[j]%.*} ]]
      then
         temp=${array[i]}
         array[i]=${array[j]}
         array[j]=$temp
      fi
   done
done

echo ${array[@]}






