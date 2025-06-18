#!/bin/bash

NUMBER=$1

if [$NUMBER -lt 10]
then
    echo "Given number $NUMBER is lessthan 10"
else
    echo "Given number $NUMBER is greaterthan 10"
fi