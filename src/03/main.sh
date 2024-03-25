#!/bin/bash
#
# Main

source ./err.sh
source ./check.sh

check_params $1 $2
start=
endt=

if [ $1 == "1" ]; then
    rm -rf $(cat ../02/log.txt | grep -e '^/' | cut -d' ' -f1)
fi

if [ $1 == "2" ]; then
    read -p "Введи дату и вермя начала промежутка в формате \"yyyy-mm-dd HHMM\":" start
    read -p "Введи дату и вермя конца промежутка в формате \"yyyy-mm-dd HHMM\":" endt
    find / -newermt "$start" -not -newermt "$endt" -delete

    # period=$(echo $input | grep [0-9][0-9]:[0-9][0-9]:[0-9][0-9]:[0-9][0-9]:[0-9][0-9][0-9][0-9]-[0-9][0-9]:[0-9][0-9]:[0-9][0-9]:[0-9][0-9]:[0-9][0-9][0-9][0-9])
    # if [ "$period" == "" ]; then
    #     err "Временной промежуток указан некорректно"
    # fi

fi

if [ $1 == "3" ]; then
    find / -regex '.*_[0-3][0-9][0-1][0-9][1-2][0-9][0-9][0-9]\..*$' -delete
fi
