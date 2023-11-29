#!/bin/bash

for (( k=1; k<=5; k++ )); do
  rm -f "logfile${k}"
done

source checkinput
source generate
