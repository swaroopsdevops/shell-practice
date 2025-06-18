#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You cant  install without root user"
    exit 1 #give other than 0 upto 127
else
    echo "Approved:: You are running with root access"
fi

dnf list installed mysql
# check already installed or not
if [ $? -ne 0 ]
then
    echo "Mysql is not installed in server. Going to install it..."
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "Installing Mysql is SUCCESS"
    else
        echo "Installing Mysql is FAILED"
        exit 1
    fi
else
    echo "Mysql is already installed in server"
    exit 1
fi