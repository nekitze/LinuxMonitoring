#!/bin/bash
#
# Main

for (( i=1; $i<=5; i++ ))
do
  goaccess ../04/access$i.log -o report$i.html --log-format=COMBINED
done