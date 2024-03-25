#!/bin/bash
#
# Проверяет параметры

function check_params() {

  if [ $# -ne 1 ]; then
    err "Неверное количество параметров."
  fi

  if ! ([[ $1 =~ ^[1-3]$ ]]); then
    err "Укажите корректный параметр"
  fi

  return 1
}
