#!/bin/bash
## created on 2015-11-23

#### List compressed files by looking for mime type

FOLDER="$1"

if [ ! -d "$FOLDER" ]; then
    echo "Give a folder"
    exit 1
fi

find "$FOLDER" -type f -exec file {} + |\
    grep compress                      |\
    cut -d: -f1                        |\
    grep -i -v ".*.rds"


exit 0 
