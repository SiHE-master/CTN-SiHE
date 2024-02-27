#!/bin/bash

while true;do
  PID=$(ps -ef|grep conn.sh|gawk '$0 !~/grep/ {print $2}' |tr -s '\n' ' ')
  if [ "$PID" = "" ]
  then
    sh conn.sh &
  fi
done