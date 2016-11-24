#!/bin/bash
############################################################################################
# chmdir.bash - Gives the user read write and execute permissions
#          for all files in the directory provided as an argument.
#
#
# Author - Luke McCann
# Version 1.0 - 20/11/2015
############################################################################################

# Creates a variable for $1 called dir.
dir=$1

# if $dir is equal to "-help" then the help information will be displayed.
if [[ $dir == -help ]] || [[ ! -d $dir ]]; then
   echo "Usage of chmdir.bash: "
   echo "Permissions for all users: chmdir.bash dir"
   echo "Permissions for only this user: chmdir.bash dir usr"
   echo "Argument must be a directory."
   fi

# if the arguments are less than one the usage information is displayed.
if [ $# -lt 1 ]; then
   echo "An argument must be provided."
   echo "Recommended Useage: chmdir.bash dir"
   fi
# The command checks that the argument is a directory and if argument $2 is equal to usr.
# if argument 2 is equal to "usr" then personal permissions are granted.
if [[ -d $dir ]] && [[ $2 == "usr" ]]; then
   chmod -R -c u=rwx $dir/*
   echo "Personal permissons  granted for files of the location $dir."
   ls -l $dir
# Otherwise if $dir addresss is given on it's own
# the argument is checked if it is a directory and universal permissions are applied.
else
if [[ -d $dir ]] && [[ $# -eq 1 ]]; then
   chmod -R -c 777 $dir/*
   echo "Universal permissions granted for files of the location $dir."
   ls -l $dir
   fi
   fi
   exit 0