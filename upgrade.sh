#!/bin/bash

PACKAGES=(
  core-js
  dotenv
  jquery
  mongodb
  socket.io
  socket.io-client
  vue
)

for APP in `more apps.txt`
do
  echo "-----------------------------"
  echo $APP
  echo "-----------------------------"
  cd /Users/stevewells/APPS/$APP
  OUTDATED=$(npm outdated)
  UPDATED=0
  for ((j = 0; j < ${#PACKAGES[@]}; j++))
  do
    PACKAGE="${PACKAGES[$j]}"
    if [ "`echo $OUTDATED | grep $PACKAGE`" != ""  ]; then
      echo $APP $PACKAGE " NEEDS UPDATING"
      UPDATED=1
      npm install ${PACKAGE}@latest
      # npm audit fix
    fi
  done
  if [ $UPDATED -eq 1 ]; then
    git add package.json
    git add package-lock.json
    git commit -m"upgrade npm packages"
    git push
  fi
done
