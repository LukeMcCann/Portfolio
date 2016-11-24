#!/bin/bash
##############################################################
# listwaste.bash - Repots all of the files currently in you're
#                  .waste directory.
#
#
# Author - Luke McCann
# Version 1.0 - 08/11/2015
#############################################################

# Declares a variables which contain the commands.
list="$(find .waste -type f -follow -print | xargs ls -l)"
command="$(find .waste -type f -follow -print | xargs wc -c)"

# Checks if the .waste directory exists, if it does not it reports to the user.
# otherwise it continues execution.
if [ ! -d ".waste" ]
then
   echo "Directory does not exist. Please run del.bash to create this directory."

# If .waste exists then it lists all of the files within the directory.
# Also lists the size of each file in bytes.
else
if [ -d ".waste" ]; then
   echo "The files currently in you're .waste directory are: "
   echo "$list"
   echo "The sizes of the files are: "
   echo "$command"
else
   echo "There was a problem with the command. Please ensure the command is spelt correctly"
   echo "and try again."
   fi
fi
exit 0
