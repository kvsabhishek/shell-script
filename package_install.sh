#! /bin/bash

LIST_OF_PACKAGE= $@

VALIDATE(){
    if [ $2 -gt 0 ]
    then 
        echo "$1 installation FAILED"
    else    
        exho "$1 installation SUCCESS"
    if
}

if [ $(id -u) -eq 0 ]
then
    for package in $LIST_OF_PACKAGE
    do
        sudo yum install package -y
        VALIDATE $package $?
    done
else
    echo "Run using sudo user"
    exit 1
if