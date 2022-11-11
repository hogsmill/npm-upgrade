#!/bin/bash

for APP in `more apps.txt`
do
  echo "-----------------------------"
  echo $APP
  echo "-----------------------------"
  cd /usr/apps/$APP
  ./deploy.sh
done
