#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of variable: $#"
echo "Current Script name: $0"
echo "Current directory: $PWD"
echo "Current User Home Directory: $HOME"
echo "User running the script: $USER"
echo "PID of the script: $$"
echo "exit status: $?"
sleep 10 &
echo "PID of the last command in background: $!"
