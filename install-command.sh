#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You cant  install without root user"
    exit 1 #give other than 0 upto 127
else
    echo "Approved"
fi

dnf install gfgfgggfgg -y

if [ $? -eq 0 ]
then
    echo "Installing Mysql is SUCCESS"
else
    echo "Installing Mysql is FAILED"
    exit 1
fi