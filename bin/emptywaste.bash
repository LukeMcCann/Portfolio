#!/bin/bash
##################################################################
# emptywaste.bash - deletes everything in the .waste directory
#                   warning! this is permanent, files cannot
#                   be recovered!.
#
# Author - Luke McCann
# Version 1.0
#################################################################

# Checks if the .waste directory contains any files.
# if it does it prompts the user for input.
# if the user responds y (yes) the files are deleted.
# Otherwise the user is notified the command has been cancelled.

if [ "$(ls -A .waste)" ]; then
   read -r -p "Do you wish to remove all files from the .waste directory? [Y/N]" answer
    if [[ $answer =~ [yY]$ ]]; then
       echo "Removing files..."
       find .waste -type f -print | xargs rm -rf
   elif [[ $answer =~ [nN]$ ]]; then
       echo "Command cancelled."
   else
       echo "invalid Input."
       echo "Please answer y/n ."
fi
fi

echo "You're .waste directory is empty."
exit 0