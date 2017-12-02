#!/usr/bin/env bash

# variable declaration
numbers=$( cat puzzle_input.txt )     # pull number list from file
found_numbers=""                      # found numbers from list
total_sum=0                           # total sum
SIZE=$(( ${#numbers} ))               # size of array
LAST_INDEX=$(( ${#numbers}-1 ))
half_size=$(( $SIZE/2 ))              # half the size of the array

# loop through the array of numbers
for (( i=0; i<${#numbers}; i++ )); do
  # get the index of an item half the size of the array forward
  half_away=$(( $i+$half_size ))

  # get the index of an item half the size of the array back since the
  # list is circular
  half_back=$(( $half_away-$SIZE ))

  # if half away is less than or equal to size
  if [[ $half_away -le $SIZE ]];
  then

    # if the number @ the current index matches 
    # the number half the index away
    if [[ "${numbers:$i:1}" == "${numbers:$half_away:1}" ]];
    then

      # add current number that matches to the total sum 
      total_sum=$(( $total_sum+${numbers:$i:1} ))
    fi

    # else half_away is greater than or equal to size
  else
    if [[ "${numbers:$i:1}" == "${numbers:$half_back:1}" ]];
    then
      # add current number that matches to the total sum
      total_sum=$(( $total_sum+${numbers:$i:1} ))
    fi
  fi
done

echo "Total Sum: $total_sum"

