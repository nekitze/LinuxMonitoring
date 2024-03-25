#!/bin/bash
#
# Main

source ./err.sh
source ./check.sh

check_params $@

if [ $1 == "1" ]; then
  for (( i=1; $i<=5; i++ ))
  do
    echo "============== access$i =============="
    awk '{print}' ../04/access$i.log | sort -n -k9
  done
fi

if [ $1 == "2" ]; then
  for (( i=1; $i<=5; i++ ))
  do
    echo "============== access$i =============="
    awk '{print $1}' ../04/access$i.log | uniq -u
  done
fi

if [ $1 == "3" ]; then
  for (( i=1; $i<=5; i++ ))
  do
    echo "============== access$i =============="
    awk '/(1.1\" 4.. )|(1.1\" 5.. )/{print}' ../04/access$i.log
  done
fi

if [ $1 == "4" ]; then
  for (( i=1; $i<=5; i++ ))
  do
    echo "============== access$i =============="
    awk '/(1.1\" 4.. )|(1.1\" 5.. )/{print}' ../04/access$i.log | awk '{print $1}' | uniq -u
  done
fi