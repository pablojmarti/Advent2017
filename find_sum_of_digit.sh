#!/usr/bin/env bash

numbers=$( cat puzzle_input.txt )
found_numbers=""
total_sum=0
SIZE=$(( ${#numbers}-1 ))

for (( i=0; i<${#numbers}; i++ )); do
  next=$(( $i+1 ))
 if [[ "${numbers:$i:1}" == "${numbers:$next:1}" ]];
 then
   found_numbers="$found_numbers${numbers:$i:1}"
 fi
done

for (( i=0; i<${#found_numbers}; i++ )); do
  total_sum=$(( $total_sum+${found_numbers:$i:1} )) 
done

if [[ "${numbers:0:1}" == "${numbers:$SIZE:1}" ]];
then
  total_sum=$(( $total_sum+${numbers:$SIZE:1} ))
fi

echo $total_sum

