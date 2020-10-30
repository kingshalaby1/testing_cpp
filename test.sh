#!/bin/bash
set -e
mkdir -p temp
file_name=$1
g++ "${file_name}".cpp -o "temp/${file_name}"
echo -e 'successfully compiled \n evaluating...'

 cat "test_cases/${file_name}" | while read line; do
  case=($line)
  expected=${case[*]: -1}
  args=${case[*]::$((${#case[*]} - 1))}
  evaluated=$(echo "${args}" | "temp/${file_name}")

  if [ "$evaluated" != "$expected" ]
  then
      printf "wrong answer \n args passed: %s \n expected: %s \n got: %s", "$args", "$expected", "$evaluated"
      exit 1
  fi
done
echo "you answer is correct"

exit 0