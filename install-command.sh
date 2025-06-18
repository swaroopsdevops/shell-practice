#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You cant  install without root user"
    exit 1 #give other than 0
else
    echo "Approved"
fi

dnf install mysql -y