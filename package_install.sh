#! /bin/bash

list_of_packages = $@

if [ $(id -u) -eq 0 ]
then
    for package in $list_of_packages
    do
        sudo yum install package -y
    done
else
    echo "Run using sudo user"
if