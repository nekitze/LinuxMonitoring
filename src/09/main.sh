#!/bin/bash
#
# Main

source /usr/bin/metrics.sh
metrics_file="/my_node_exporter/index.html"

while true; do
  metrics=$(get_metrics)
  echo "$metrics" > $metrics_file
  sleep 5;
done
