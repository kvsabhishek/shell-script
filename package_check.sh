#!/bin/bash

read -p "Enter package name" PACKAGE_NAME

if yum list installed $PACKAGE_NAME >/dev/null 2>&1; then
    echo "$PACKAGE_NAME is installed."
else
    echo "$PACKAGE_NAME is not installed."
fi