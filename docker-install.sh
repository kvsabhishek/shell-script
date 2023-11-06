#!/bin/bash

R="\e[31m"
N="\e[0m"
G="\e[32m]"

VALIDATE(){
    if [ $2 -gt 0 ]
    then 
        echo -e "$1  ....... $R FAILED $N"
    else    
        echo -e "$1 ....... $G SUCCESS $N"
  fi
}

if [ "$(id -u)" -eq 0 ]
then
    
    sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine

    VALIDATE $? "Deleting old versions"

    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

    VALIDATE $? "Set up the repository" 

    sudo yum install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    VALIDATE $? "Installing docker"

    sudo systemctl start docker

    VALIDATE $? "Starting docker service"

else
    echo $R "RUN USING SUDO USER" $N
    exit 1
fi