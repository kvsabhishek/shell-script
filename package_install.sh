#! /bin/bash

LOGFILE=/tmp/Abhishek_$(date +%F).log

R="\e[31m"
N="\e[0m"
G="\e[32m]"



VALIDATE(){
    if [ $2 -gt 0 ]
    then 
        echo -e "$1 installation ....... $R FAILED $N" &>>$LOGFILE
    else    
        echo -e "$1 installation ....... $G SUCCESS $N" &>>$LOGFILE
    fi
}

if [ "$(id -u)" -eq 0 ]
then
    for PACKAGE in $@
    do
        yum install $PACKAGE -y &>>$LOGFILE
        VALIDATE "$PACKAGE" $?
    done
else
    echo "Run using sudo user"
    exit 1
fi