#!/bin/bash
#
# Проверяет параметры

function check_params() {

  if [ $# -ne 6 ]; then
    err "Неверное количество параметров."
  fi

  if ! [ -d $1 ]; then
    err "Указанный путь не существует"
  fi

  if ! [[ $2 =~ ^[0-9]+$ ]]; then
    err "Укажите корректное количество вложенных папок"
  fi

  if  [ "${#3}" -gt 7 ] || ! ([[ $3 =~ ^[a-zA-Z]+$ ]]); then
    err "Укажите корректный список используемых букв для названий папок"
  fi

  if ! [[ $4 =~ ^[0-9]+$ ]]; then
    err "Укажите корректное количество файлов"
  fi
  
  withType=$(echo $5 | grep -o '\.')
  name=$(echo $5 | cut -d '.' -f1)
  type=$(echo $5 | cut -d '.' -f2)

  if  [ "${#name}" -gt 7 ] || ! ([[ $name =~ ^[a-zA-Z]+$ ]]) || ! ([ "$withType" == "." ]); then
    err "Укажите корректный список используемых букв для названий файлов"
  fi
  if  [ "${#type}" -gt 3 ] || ! ([[ $type =~ ^[a-zA-Z]+$ ]]) || ! ([ "$withType" == "." ]); then
    err "Укажите корректный список используемых букв для расширения файлов"
  fi

  if ! ([[ $6 =~ ^[0-9]+kb+$ ]]) || [ ${6::-2} -gt 100 ]; then
    err "Укажите корректный раземер файлов"
  fi

  return 1

}
