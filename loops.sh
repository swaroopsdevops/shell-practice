#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER=/var/log/shellscript-logs
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "nginx" "python3" "httpd")

mkdir -p $LOGS_FOLDER
echo "Script started executing at: $(date)" tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N" tee -a $LOG_FILE
else
    echo -e "$G APPROVED: You are running this script with root access $N" tee -a $LOG_FILE
fi

VALIDATE()
{
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2 is ... $G SUCCESS $N" tee -a $LOG_FILE
    else
        echo -e "Installing $2 is ... $R FAILED $N" tee -a $LOG_FILE
        exit 1
    fi
}

for package in ${PACKAGES[@]}
do

    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo -e "$G $package is not installed. lets do it. $N" tee -a $LOG_FILE
        dnf install $package -y
        VALIDATE $? $package
    else
        echo -e "$Y $package is already installed. $N" tee -a $LOG_FILE
    fi

done


# dnf list installed python3 &>>$LOG_FILE
# if [ $? -ne 0 ]
# then
#     echo -e "$G python3 is not installed. lets do it. $N" tee -a $LOG_FILE
#     dnf install python3 -y &>>$LOG_FILE
#     VALIDATE $? "python3"
# else
#     echo -e "$Y python3 is already installed.$N" tee -a $LOG_FILE
# fi

# dnf list installed nginx &>>$LOG_FILE
# if [ $? -ne 0 ]
# then
#     echo -e "$G nginx is not installed. lets do it. $N" tee -a $LOG_FILE
#     dnf install nginx -y &>>$LOG_FILE
#     VALIDATE $? "nginx"
# else
#     echo -e "$Y nginx is already installed. $N" tee -a $LOG_FILE
# fi