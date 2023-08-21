#! /bin/bash

LIST_OF_PACKAGE= $@
USERID= $(id -u)
LOGFILE=/tmp/$(date +%F).log

R="\e[31m"
N="\e[0m"
G="\e[32m]"



VALIDATE(){
    if [ $2 -gt 0 ]
    then 
        echo "$1 installation ....... $R FAILED $N"
    else    
        exho "$1 installation ....... $G SUCCESS $N"
    fi
}

if [ $USERID -eq 0 ]
then
    for PACKAGE in $LIST_OF_PACKAGE
    do
        yum install $PACKAGE -y &>>$LOGFILE
        VALIDATE "$PACKAGE" $?
    done
else
    echo "Run using sudo user"
    exit 1
fi