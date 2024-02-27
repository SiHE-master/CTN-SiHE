#!/bin/bash

out_url="baidu.com"
netgate_url="10.199.160.1"

while true;do
  PID=$(ps -ef|grep conn_guard.sh|gawk '$0 !~/grep/ {print $2}' |tr -s '\n' ' ')
  if [ "$PID" = "" ]
  then
    sh conn_guard.sh &
  fi
  PING_OUTER=`ping -c 3 ${out_url} | grep '0 received' | wc -l`
  if [ "$PING_OUTER" -ne 0 ]
  then
    PING_NETGATE=`ping -c 3 ${netgate_url} | grep '3 received' | wc -l`
    if [ "$PING_NETGATE" -eq 0 ]
    then
      date >> ctn.log
      echo "failed to ping network gate" >> ctn.log
      echo "622" | sudo -S sudo service network-manager restart
      sleep 10
      PING_NETGATE=`ping -c 3 ${netgate_url} | grep '3 received' | wc -l`
      if [ "$PING_NETGATE" -eq 0 ]
      then
        date >> ctn.log
        echo "restart did not work" >> ctn.log
      else
        date >> ctn.log
        echo "restart did work" >> ctn.log
      fi
    else
      /home/zp/anaconda3/bin/python3.7 conn.py
      PING_OUTER=`ping -c 3 ${out_url} | grep '0 received' | wc -l`
      if [ "$PING_OUTER" -ne 0 ]
      then
        date >> ctn.log
        echo "connect failed" >> ctn.log
      else
        date >> ctn.log
        echo "connect success" >> ctn.log
      fi
    fi
  fi
done