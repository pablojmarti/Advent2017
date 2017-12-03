#!/usr/bin/env bash

# variables
puzzle_file=day02_puzzle_input.txt
ROW_COUNT=$( awk '{print NF}' $puzzle_file | sort -nu | tail -n 1 )
COLUMN_COUNT=$( cat $puzzle_file | wc -l )
MAX=""
MIN=""
TOTAL_SUM=0

# while loop to read in the input
while IFS= read -a line; do

  # Outer for loop
  for i in $line;
  do

    # inner for loop
    for j in $line;
    do
      
      # store the remainder from modulo into a var
      remainder=$(( $i % $j ))

      # if the remaind is equal to zero meaning
      # the two numbers are divisible
      if [[ $remainder -eq 0 ]];
      then

        #then, if the numbers are not the same
        if [[ ! $i -eq $j ]];
        then

          # store the quotient into a var
          ROW_VALUE=$(( $i / $j ))
        fi
      fi
    done
  done

  # add the total sum to the value from the row
  TOTAL_SUM=$(( $TOTAL_SUM+$ROW_VALUE ))
done < "$puzzle_file"

# stdout total sum
echo $TOTAL_SUM
