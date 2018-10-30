#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

REMINDER_TIME=$1
REMINDER_TEXT=$2

if [[ ! "${REMINDER_TIME}" = *":"*  ]]; then
  REMINDER_TIME_IN_SECONDS=$(($(date +%s) + ((${REMINDER_TIME} * 60))))
  REMINDER_TIME=$(date -d @${REMINDER_TIME_IN_SECONDS} '+%H:%M')
fi

nohup ${SCRIPT_DIR}/schedule_notification.sh ${REMINDER_TIME} ${REMINDER_TEXT} > /dev/null 2>&1 &
