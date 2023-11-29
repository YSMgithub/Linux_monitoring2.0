#!/bin/bash

rm -f report.html

source checkinput

if [[ $1 -eq 1 ]]; then
  additional="--sort-panel=STATUS_CODES,BY_DATA,ASC"
fi

# Unique IPs
if [[ $1 -eq 2 ]]; then
  additional="--sort-panel=VISITORS,BY_VISITORS,ASC"
fi

# Requests with errors
if [[ $1 -eq 3 ]]; then
  additional="--ignore-status=200 --ignore-status=201 --sort-panel=REQUESTS,BY_DATA,ASC"
fi

#  Unique IPs found among the erroneous requests
if [[ $1 -eq 4 ]]; then
  additional="--ignore-status=200 --ignore-status=201 --sort-panel=VISITORS,BY_VISITORS,ASC"
fi

goaccess ../04/logfile* "$additional" --date-format=%d/%b/%Y --log-format='%h %^ %^ [%d:%t %^] \"%r\" %s %b %^ %u' --time-format=%T -o report.html
