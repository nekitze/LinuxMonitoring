#!/bin/bash
#
# Main

START=$(date +%s)

source ./err.sh
source ./check.sh
source ./generator.sh

check_params $@
generate $1 $2 $3

END=$(date +%s)
DIFF=$(( $END - $START ))

echo "Start time = $START" >> log.txt
echo "End time = $END" >> log.txt
echo "Total time = $DIFF" >> log.txt

echo "Start time = $START"
echo "End time = $END"
echo "Total time = $DIFF"

