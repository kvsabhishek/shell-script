#!/bin/bash

input_filename="input.txt"
output_filename="output.txt"
target_word=$1
replacement_word=$2

if [ ! -f "$input_filename" ]; then
    echo "Input file '$input_filename' not found."
    exit 1
fi

sed "s/$target_word/$replacement_word/g" "$input_filename" > "$output_filename"
echo "Occurrences of '$target_word' replaced with '$replacement_word' in '$input_filename'."

