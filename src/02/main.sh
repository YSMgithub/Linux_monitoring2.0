#!/bin/bash

date=$(date +"%d%m%y_%s")
FILE=logfile
if [ -f $FILE ]
then
    mv logfile ${date}_logfile
fi

source checkinput
source create
