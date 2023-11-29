#!/bin/bash

source checkinput

# By response code
if [[ $1 -eq 1 ]]; then
  for (( i=1; i<=5; i++ )); do
    filename="../04/logfile${i}"
    cat $filename | sort -k8
  done
fi

# Unique IPs
if [[ $1 -eq 2 ]]; then
  for (( i=1; i<=5; i++ )); do
    filename="../04/logfile${i}"
    cat $filename | awk '{print $1}' | sort -u
  done
fi

# Requests with errors
if [[ $1 -eq 3 ]]; then
  for (( i=1; i<=5; i++ )); do
    filename="../04/logfile${i}"
    cat $filename | awk '{print $8";"$0}' | grep -E "(^4)|(^5)" | awk -F ";" '{print $2}'
  done
fi

#  Unique IPs found among the erroneous requests
if [[ $1 -eq 4 ]]; then
  for (( i=1; i<=5; i++ )); do
    filename="../04/logfile${i}"
    cat $filename | awk '{print $8";"$0}' | grep -E "(^4)|(^5)" | awk -F ";" '{print $2}' | awk '{print $1}' | sort -u
  done
fi
