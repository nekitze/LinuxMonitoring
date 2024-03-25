#!/bin/bash
#
# Выводит сообщение об ошибке

err() {

  echo -e "${RED}[$(date +'%Y-%m-%dT%H:%M:%S%z')]:\e[0m $@" >&2
  exit 1
 
}
