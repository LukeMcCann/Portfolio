#!/bin/bash
############################################################################################$
# del - Moves items to a .waste directory.
#        Takes the filename as an argument.
#
#
# Author - Luke McCann 
# Version 1 - 01/11/2015
############################################################################################$

# Checks for and argument and recommends an appropriate use for the command.
if [ $# -lt 1 ]
then
   echo "Argument Required."
   echo "Recommended Useage: del.bash file"
   fi

# Checks if the directory .waste already exists.
# If the directory does not exist it creates a new .waste directory
# then moves the file.
# if it does then it simply moves the file.
if [ ! -d .waste ];then
   mkdir .waste
   echo "Creating .waste directory...."
else
  mv $1 > .waste
fi
# Informs the user the move has been sucessful.
  mv $1 .waste
   echo "File has been successfully moved to you're .waste directory."
exit 0
