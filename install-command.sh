#!/bin/bash

USER=$(id -u)

if[ $USER -ne 0 ]
then
    echo "ERROR:: You can't  install without root user"
else
    echo "Approved"

dnf install mysql -y