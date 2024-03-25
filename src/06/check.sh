#!/bin/bash
#
# Проверяет параметры

function check_params() {

  if [ $# -ne 0 ]; then
    err "Не принимает параметров."
  fi

  return 1
}
