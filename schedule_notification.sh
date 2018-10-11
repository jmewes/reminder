#!/bin/bash

REMINDER_TIMER=$1
REMINDER_TEXT=$2

function sleep_until {
  seconds=$(( $(date -d "$*" +%s) - $(date +%s) )) # Use $* to eliminate need for quotes
  echo "Sleeping for $seconds seconds"
  sleep $seconds
}

sleep_until $REMINDER_TIMER
notify-send  -u critical -t 0 "Reminder" $REMINDER_TEXT
