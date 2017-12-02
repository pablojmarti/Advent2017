#!/usr/bin/env bash

puzzle_file=day02_puzzle_input.txt
ROW_COUNT=$( awk '{print NF}' $puzzle_file | sort -nu | tail -n 1 )
COLUMN_COUNT=$( cat $puzzle_file | wc -l )
MAX=""
MIN=""
TOTAL_SUM=0

i=1
while IFS= read -a line; do
  MAX=$(echo ${line[*]} | tr " " "\n" | sort -nr | tr "\n" " " | cut -d " " -f1)
  MIN=$(echo ${line[*]} | tr " " "\n" | sort -n | tr "\n" " " | cut -d " " -f1)
  
  ROW_VALUE=$(( $MAX-$MIN ))

  echo $ROW_VALUE
  TOTAL_SUM=$(( $TOTAL_SUM+$ROW_VALUE ))
  
  let i++
done < "$puzzle_file"
echo $TOTAL_SUM
