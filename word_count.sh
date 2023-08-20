#!/bin/bash

filename="dummyfile.txt"  # Replace with your file name

if [ ! -f "$filename" ]; then
    echo "File '$filename' not found."
    exit 1
fi

# Convert text to lowercase, tokenize into words, and count frequencies
word_frequency_list=$(tr '[:upper:]' '[:lower:]' < "$filename" | tr -cs '[:alnum:]' '\n' | sort | uniq -c | sort -nr)

echo "Word Frequency:"
echo "$word_frequency_list"
