#!/bin/bash
(
  cd "${1}"
  for i in $(ls -d */)
  do
    (
      echo "${i}"
      cd "${i}"
      git config user.name "${2}"
      git config user.email "${3}"
      #git pull --rebase
      git pull
      git reset --hard HEAD
    )
  done 
)
