#!/bin/bash

for log in /logstash/hostlogs/*; do
  python /home/elk_user/evtxtoelk.py $log
    echo "Adding $log to ES"
  fi
done
