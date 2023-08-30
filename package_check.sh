#!/bin/bash

read -p "Enter package name" PACKAGE_NAME

if yum list installed $PACKAGE_NAME >/dev/null 2>&1; then #If condition will work based on the status code if status code 0 if will execute. Greater than 0 else will execute
    echo "$PACKAGE_NAME is installed."
else
    echo "$PACKAGE_NAME is not installed."
fi


#yum list installed $PACKAGE_NAME >/dev/null 2>&1   ------> This retunrs only the status code of 
#   $? = 0 ------> If package installed
#   $? = 1 ------> If package not found/installed