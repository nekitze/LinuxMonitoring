#!/bin/bash
#
# Генерирует папки и файлы

date=$(date +"%d%m%Y")

folder_name=""
file_name=""
file_type=""
file_size=""
files_count=""

function generate() 
{
  
  folder_name=$1
  file_name=$(echo $2 | cut -d '.' -f1)
  file_type=$(echo $2 | cut -d '.' -f2)
  file_size=$3
  i="1"
  while [ $(df -h -B K / | \
      awk '/\//{printf "%d", $4/1024}') -gt "1000" ]
  do
    folder=$(gen_folder_name $i)
    directory=$(sudo find / -type d | grep -e bin -e sbin -v |shuf -n1) 
    let "i++"
    mkdir "$directory/$folder"
    files_count=$(shuf -i 1-100 -n 1)
    echo $(readlink -f "$directory/$folder") $date >> log.txt
    while [ $files_count -gt 0 ] && [ $(df -h -B K / | \
      awk '/\//{printf "%d", $4/1024}') -gt "1000" ]
    do
      file=$(gen_file_name $files_count)
      fallocate -l ${file_size::-1} $directory/$folder/$file
      created=$(readlink -f "$directory/$folder/$file")
      if [ -f "$directory/$folder/$file" ]; then
        echo $created $date $file_size >> log.txt
      fi
      let "files_count--"
    done
  done

}

function gen_folder_name()
{ 
  letter=${folder_name:0:1}
  let "count=$1"

  if [ ${#folder_name} -le 3 ]; then
    let "count=$1+3"
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
  let "count=$1"

  if [ ${#file_name} -le 3 ]; then
    let "count=$1+3"
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