#!/bin/bash

REMINDER_TIMESTAMP=$1
REMINDER_TEXT=$2

function sleep_until {
  seconds=$(( $1 - $(date +%s) ))
  echo "Sleeping for $seconds seconds"
  sleep $seconds
}

sleep_until $REMINDER_TIMESTAMP
notify-send  -u critical -t 0 "Reminder" $REMINDER_TEXT
