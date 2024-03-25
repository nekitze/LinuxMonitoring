#!/bin/bash
#
# Main

source ./err.sh
source ./check.sh
source ./generator.sh

check_params $@
generate $1 $2 $3 $4 $5 $6




