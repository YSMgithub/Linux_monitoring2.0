#!/bin/bash

source checkinput

date=$(date +"%d%m%y_%s")
FILE=logfile
if [ -f $FILE ]
then
    mv logfile ${date}_logfile
fi

if [[ $1 -eq 1 ]]; then
  source by_log
fi

if [[ $1 -eq 2 ]]; then
  source by_date
fi

if [[ $1 -eq 3 ]]; then
  source by_name
fi
