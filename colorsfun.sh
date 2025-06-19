#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N"
else
    echo "APPROVED: You are running this script with root access"
fi

VALIDATE()
{
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is ... $G SUCCESS $N"
    else
        echo -e "Installing $2 is ... $R FAILED $N"
        exit 1
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e "$G mysql is not installed. lets do it. $N"
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo -e "$Y mysql is already installed. $N"
fi

dnf list installed python3
if [ $? -ne 0 ]
then
    echo -e "$G python3 is not installed. lets do it. $N"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "$Y python3 is already installed.$N"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
    echo -e "$G nginx is not installed. lets do it. $N"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "$Y nginx is already installed. $N"
fi