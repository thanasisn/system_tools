#!/bin/bash
## created on 2016-09-24

#### list unique extensions and count them


folder="$1"

if [ ! -d "$folder" ];then
    echo "Give a folder"
    exit 1
fi

echo " FOLDER:  $folder "
echo ""
echo "----  Counts  ----"
echo ""

find "$folder" -type f -iname "*.*" |\
    grep -o -E "\.[^\.]+$"          |\
    awk '{print tolower($0)}'       |\
    sort                            |\
    uniq -c                         |\
    sort -n
echo " $(find "$folder"  -type f ! -name "*.*" | wc -l)  NO EXTENSION "



echo ""
echo "----  Sorted    ----"
echo ""

find "$folder" -type f -iname "*.*" |\
    grep -o -E "\.[^\.]+$"          |\
    awk '{print tolower($0)}'       |\
    sort -u



# find "$folder" -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort -u

# find "$folder" -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort | uniq -c | sort -n

# find "$folder" -type f -iname "*.*" | grep -o -E "\.[^\.]+$" | awk '{print tolower($0)}' | sort -u

exit 0
