#!/bin/bash
##########################################################################
# digitalDay.bash - takes a single numeric argument and prints the day
#                   based on the formula day modulo 7.
#
# Author - Luke McCann
# Version 2.0 - 07/11/2015
##########################################################################

# Offers a help statement
if [[ $1 == -help ]]; then
    echo "Recommended Useage: digitalDay.bash int"
    echo "Please only enter numeric arguments."

# Tests whether an argument is present and that the argument is numeric.
else
if [ $# -lt 1 ]; then
    echo "Requires a numeric argument."
    echo "Recommended Useage: digitalDay.bash num"

# If the argument supplied is numeric execution is continued.
else
if [[ $1 =~ ^[0-9]+$ ]]; then
    
# A variable called day is supplied to hold the calculation.
day="$(($@%7))";

## a case statement is then used to provide the patterns for the calculation.
case $day in
    0) echo "Sunday"
    ;;
    1) echo "Monday"
    ;;
    2) echo "Tuesday"
    ;;
    3) echo "Wednesday"
    ;;
    4) echo "Thursday"
    ;;
    5) echo "Friday"
    ;;
    6) echo "Saturday"
    ;;
    *) echo "Unknown - Please enter a numeric value and try again."
esac
else
  echo "Not an integer, please enter a numeric value."
fi
fi
fi
exit 0
