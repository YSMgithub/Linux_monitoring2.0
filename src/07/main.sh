#!/bin/bash

source checkinput

# node exporter
if [[ $1 -eq 1 ]]; then
  wget https://github.com/prometheus/node_exporter/releases/download/v1.3.1/node_exporter-1.3.1.linux-amd64.tar.gz
  tar xvfz node_exporter-1.3.1.linux-amd64.tar.gz
  rm -f node_exporter-1.3.1.linux-amd64.tar.gz
  cd node_exporter-1.3.1.linux-amd64 && ./node_exporter
fi

# prometeus
if [[ $1 -eq 2 ]]; then
  wget https://github.com/prometheus/prometheus/releases/download/v2.37.0/prometheus-2.37.0.linux-amd64.tar.gz
  tar xvzf prometheus-2.37.0.linux-amd64.tar.gz
  cp prometheus.yml ./prometheus-2.37.0.linux-amd64/
  rm -f prometheus-2.37.0.linux-amd64.tar.gz
  cd prometheus-2.37.0.linux-amd64 && ./prometheus


fi

# grafana
if [[ $1 -eq 3 ]]; then
  sudo apt-get install -y apt-transport-https
  sudo apt-get install -y software-properties-common wget
  wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
  echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list
  sudo apt-get update
  sudo apt-get install grafana

  systemctl start grafana-server.service
  systemctl enable grafana-server.service
fi

# stress
if [[ $1 -eq 4 ]]; then
  sudo apt install -y stress
  stress -c 2 -i 1 -m 1 --vm-bytes 32M -t 30s
fi
