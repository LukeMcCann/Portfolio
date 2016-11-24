#!/bin/bash
#######################################################################################
# wastesieze.bash - reports the number of files in you're .waste directory.
#
#
# Author - Luke McCann U1364096
# Version - 1.0 - 20/11/2015
#
#######################################################################################

# Checks to see if there is a .waste directory.
# If there is no .waste directory, it reports a message to the user asking them to
# run del.bash to create the directory.
# Otherwise execution is continued.
if [ ! -d ".waste" ]
then
   echo "Directory does not exist. Please run del.bash to create this directory."
# If there is a .waste directory the command finds the directory.
# if then reports the number of files found in the directory to the user.
else
if [ -d ".waste" ]; then
   echo "Number of files currently in you're .waste directory: "
   find .waste -type f | wc -l
# If an error occurs the user will receive a report asking them to retype the command.
# note that you should never see this output.
else
   echo "There was a problem with the command. Please ensure the command is spelt correctly 'wastesize.b$
   echo "and try again."
   fi
fi
exit 0
