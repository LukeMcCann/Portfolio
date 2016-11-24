#! /bin/bash
###########################################################
# chmx - This command takes a filenames as arguments,
#        it then makes  those files executable by all users.
#
# Uses - chmx.bash filename - changes permissions for all
#                            users to executable.
#
# Luke McCann 
# Version 1.0 - 19/11/2015
############################################################

# Checks for an argument.
# if no argument is supplied alert the user and recommend a valid input and
# recommend a usage.
if [ $# -lt 1 ]
then
    echo "Must have an argument."
    echo "Recommended: chmx.bash filename"
    exit

# Changes permissions to executable and readable by all users.
else
   chmod  775 $1
   echo "Permissions granted for $1"
fi
exit
