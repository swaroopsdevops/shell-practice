#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR:: You cant  install without root user"
else
    echo "Approved"
fi

dnf install mysql -y