#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
else
    echo "APPROVED: You are running this script with root access"
fi

VALIDATE()
{
    if [ $1 -eq 0 ]
    then
        echo "Installing $2 is SUCCESS"
    else
        echo "Installing $2 is FAILED"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "mysql is not installed. lets do it."
    dnf install mysql
    VALIDATE $? "mysql"
else
    echo "mysql is already installed."
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed. lets do it."
    dnf install python3
    VALIDATE $? "python3"
else
    echo "python3 is already installed."
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed. lets do it."
    dnf install nginx
    VALIDATE $? "nginx"
else
    echo "nginx is already installed."
fi