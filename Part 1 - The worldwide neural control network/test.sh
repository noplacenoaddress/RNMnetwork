#!/bin/bash
input="$1"
while IFS= read -r line
do
	fold -w 1 `echo "$line"`
done < "$input"
