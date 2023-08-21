#! /bin/bash

LIST_OF_PACKAGE= $@
USERID= $(id -u)

VALIDATE(){
    if [ $2 -gt 0 ]
    then 
        echo "$1 installation ....... FAILED"
    else    
        exho "$1 installation ....... SUCCESS"
    fi
}

if [ $USERID -eq 0 ]
then
    for PACKAGE in $LIST_OF_PACKAGE
    do
        sudo yum install $PACKAGE -y
        VALIDATE $PACKAGE $?
    done
else
    echo "Run using sudo user"
    exit 1
if