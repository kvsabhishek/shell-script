#!/bin/bash

file_path=$1
search_line=$2

if grep -qF "$search_line" "$file_path"; then #If condition will work based on the status code if status code 0 if will execute. Greater than 0 else will execute
    echo "Line exists in the file."
else
    echo "Line does not exist in the file."
fi

#grep -qF "$search_line" "$file_path"  ------> This retunrs only the status code of 
#   $? = 0 ------> If package installed
#   $? = 1 ------> If package not found/installed