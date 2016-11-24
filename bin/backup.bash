#!/bin/bash
#################################################################################################
# backup.bash - backs up the files within a directory
#               specified by the argument, copies the files
#               from the directory to a special .backup directory.
#
#
# Author - Luke McCann
# Version 1.0 - 20/11/2015
###############################################################################################

# Creates a variable named $dir
dir=$1
# Checks if there is an argument provided.
# If no argument is found it asks the user to provide one
# and recommends how the command should be used.
if [ $# -lt 1 ]; then
    echo "At least one argument required."
    echo "Recommended Useage: backup.bash directory"
    exit 1;
# Checks if there is a directory called .backup.
# If no directory is found it creates and copies the arguments to
# a .backup directory
# Otherwise the file is just copied.
elif [ ! -d .backup ]; then
   echo "Creating .backup directory..."
   mkdir .backup
   cp $dir/* .backup
else
   cp $dir/* .backup
   echo "Backup of $@ successful!"
fi
exit 0
