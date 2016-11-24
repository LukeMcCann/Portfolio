#!/bin/bash
####################################################
# lshead - lists the first $1  lines of every file
#          in the directory specified by the argument.
#          $1 being a specified number.
#
# Author Luke McCann 
# Version 2.0 - 15/12/2015
#####################################################

# Declares variables for the arguments.
lines=$2
dir=$3
ht=$1

# Tests that there are three arguments, if there are it continues with the
# execution, if not it reports useage recommendation to the user.
if [ $# -lt 3 ]; then
   echo "Three Arguments Required."
   echo "Recommended Useage: lshead.bash $head 2 $dir"
   echo "Example: ishead.bash head num directory."

# If 3 arguments are found the execution is continued.

# The next test is to find the user input and check that $1 is equal to
# head or tail.
# if the argument is equal to head it iterates throgh the location $dir/* then runs the head
# command for each file.
else
if [ $ht = head ]; then
  for i in $(ls $dir);
  do head -$lines $dir/$i
  done
  fi

# If the argument is equal to tail the command iterates through $dir/* however runs the tail command isntead.
if [ $ht = tail ]; then
  for i in $(ls $dir);
  do echo $i; tail -$lines $dir/$i
  done
  fi
  fi
  exit 1;

# If the argument is not equal to head or tail then "Invalid Input" is reported to the user.
if [[ $ht != head ]] || [[ $ht != tail ]]; then
   echo "Invalid Input: Please only use 'head -num $dir' or 'tail -num $dir'"
fi
exit 0
