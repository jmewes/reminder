#!/bin/bash

REMINDER_TIME=$1
REMINDER_TEXT=$2

function sleep_until {
    seconds=$(( $1 - $(date +%s) ))
    echo "[Debug] $(date '+%H:%M:%S') : Sleeping for $seconds seconds"
    sleep $seconds
}

REMINDER_TIMESTAMP=$(date -d "${REMINDER_TIME}" +%s)

sleep_until $REMINDER_TIMESTAMP

if [[ "$OSTYPE" == "darwin"* ]]; then
    terminal-notifier -title "Reminder" -message "$REMINDER_TEXT"
else
    notify-send  -u critical -t 0 "Reminder" $REMINDER_TEXT
fi
