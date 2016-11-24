
#!/bin/bash
###########################################################################
# sort.bash - takes one - two arguments allowing the user a choice
#                         of whether to sort a directory alphabetically
#                         or by filesize, also display information about
#                         the directory.
#
# Alphabetical Sort: sort.bash dir abc
# Sort By Bytes: sort.bash dir
# Merge: sort.bash dir dir
# Help: sort.bash -help
# 
# Author - Luke McCann
# Version 2.0 - 04/12/2015
#
###########################################################################

# Declares a variable for input $1.
dir=$1

# Provides the user with a help guide to using the command.
if [[ $dir == -help ]]; then
   echo "Useage of sort.bash: "
   echo "Alphabetical Sort - sort.bash dir abc"
   echo "Sort by bytes - sort.bash dir"
   echo "Merge - sort.bash dir dir"


# If no argument is provided, report to the user and
# recommend suitable useage.
# If there is an argument, the command reports the filepath and size of the directory
# in bytes.
if [ $# -lt 1 ]; then
   echo "Please provide at least one  argument."
   echo "Recommended Useage: sort.bash dir [option]"
   echo "Options: abc , dir"
else
   echo "The path to $dir is: "
   find . -name $dir -print
   echo "The size of $dir in bytes: "
   du -sk
fi

# The command then checks to see if argument $2 is equal to "abc"
# if the command matches the String it will ask the user if they wish to
# sort argument $dir alphabetically.
# If the user answers y the files will be ordered
# otherwise the command will report files have not been sorted
# and end execution.
if [[ $2 == "abc" ]]; then
    read -r -p "$dir is to be sorted in alphabetical order? [Y/N]" answer
       if [[ $answer =~ [yY]$ ]]; then
         find $dir -type f -print | xargs sort
         echo "Files have been sorted alphabetically."
       elif [[ $answer =~ [nN]$ ]]; then
         echo "Files have not been sorted."
         fi
         fi

# If only one argument is provided, the command will default to sort by filesize.
# if the user answers y then the files will be ordered.
# otherwise the command will report the files have not been sorted
# and end execution.
if [[ $# -eq 1 ]]; then
    read -r -p "Do you wish to sort the directory $dir by size? [Y/N]" answer
       if [[ $answer =~ [yY]$ ]]; then
         find $dir -type f -print | xargs sort -rh
         echo "Files in directory $dir have been sorted in size order."
       elif [[ $answer =~ [nN]$ ]]; then
          echo "Files have not been sorted."
          fi
          fi

# If $2 is a directory, then both directories will be merged together.
if [[ -d $2 ]]; then
   cp -r -n $dir/* $2/
   echo "$dir has been merged with $2."
   fi
exit 0

