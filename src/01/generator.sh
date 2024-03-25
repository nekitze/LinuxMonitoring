#!/bin/bash
#
# Генерирует папки и файлы

date=$(date +"%d%m%Y")

path=""
folders=""
folder_name=""
files=""
file_name=""
file_type=""
file_size=""

function generate() 
{ 
  if [[ $1 =~ .*[/]+$ ]]; then
    path=${1::-1}
    echo $path
  else
    path=$1
  fi
  
  folders=$2
  folder_name=$3
  files=$4
  file_name=$(echo $5 | cut -d '.' -f1)
  file_type=$(echo $5 | cut -d '.' -f2)
  file_size=$6

  for (( i=1; i<=folders; i++ ))
  do
    folder=$(gen_folder_name $i)
    mkdir "$path/$folder"
    echo $(readlink -f "$path/$folder") $date >> log.txt
    for (( j=1; j<=files; j++ ))
    do
      file=$(gen_file_name $j)
      fallocate -l ${file_size::-1} $path/$folder/$file
      echo $(readlink -f "$path/$folder/$file") $date $file_size >> log.txt
      if [ $(df -h -B K / | \
      awk '/\//{printf "%d", $4/1024}') -le "1000" ]; then
        exit 0
      fi
    done
  done

}

function gen_folder_name()
{ 
  letter=${folder_name:0:1}
  let "count = $1"

  if [ ${#folder_name} -le 3 ]; then
    let "count = $1 + 3"
  fi

  export letter
  export count
  export date

  perl -e 'print "$ENV{letter}" x $ENV{count}'

  for (( c=1; c<${#folder_name}; c++ ))
  do
    letter=${folder_name:$c:1}
    perl -e 'print "$ENV{letter}"'
  done

  perl -e 'print "_$ENV{date}"'
}

function gen_file_name()
{
  letter=${file_name:0:1}
  let "count = $1"

  if [ ${#file_name} -le 3 ]; then
    let "count = $1 + 3"
  fi

  export letter
  export count
  export file_type
  export date

  perl -e 'print "$ENV{letter}" x $ENV{count}'

  for (( c=1; c<${#file_name}; c++ ))
  do
    letter=${file_name:$c:1}
    perl -e 'print "$ENV{letter}"'
  done

  perl -e 'print "_$ENV{date}"'
  perl -e 'print ".$ENV{file_type}"'
}