#!/bin/bash
#
# Gererates ip address in 255.255.255.255

function generate_ip {
  pt1=$(shuf -i 0-255 -n1)
  pt2=$(shuf -i 0-255 -n1)
  pt3=$(shuf -i 0-255 -n1)
  pt4=$(shuf -i 0-255 -n1)

  ip="$pt1.$pt2.$pt3.$pt4"

  echo $ip
}

function generate_code {
  echo $(shuf codes.conf -n1)
}

function generate_day {
  year=2022
  month=$(shuf -i 1-12 -n1)
  day=$(shuf -i 1-31 -n1)

  echo $(date +'%h %d %Y' --date "$year/$month/$day")
}

function generate_time() {
  time_n=$(date +%T)
  echo $(date +%d/%h/%Y:%H:%M:%S --date "$1 $2 $3 $time_n")
}

function generate_method {
  echo $(shuf methods.conf -n1)
}

function generate_user_agent {
  echo $(shuf user_agents.conf -n1)
}

function generate_url {
  echo "/$(grep -e "'" -v ./words | shuf -n1)/$(grep -e "'" -v ./words | shuf -n1).html"
}

function generate_bytes {
  echo $(shuf -i 18-8192 -n1)
}

