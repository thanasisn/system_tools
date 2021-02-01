#!/bin/bash

#### Get info for scripts containing a specified header

key="####"
folder="$1"


getcomments(){
    ## get comments from files bases on key
    folder="$1"
    key="$2"
    grep "$key" $(find "$folder" -maxdepth 1  -name "*.sh" | sort) |\
        sed -e "s@$folder/@@g" -e "s@:$key@;@g" -e "/$key/d" |\
        column -t -s ";"
}


getcomments "$folder" "$key"

exit

# find "$folder" -type d | sed "/\/\./d" | while read line ; do
#     echo ""
#     printf "\t\t $line \n"
#     echo ""
#
#     folder="$line"
#     grep $key $(find "$folder" -maxdepth 1  -name "*.sh" | sort) | sed -e "s@$folder/@@g" -e "s@:$key@;@g" -e "/$key/d" | column -t -s ";"
#
#     # getcomments "$line" "$key"
#     (( i++ ))
#     #echo $i
# done





