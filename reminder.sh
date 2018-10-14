#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

REMINDER_TIME=$1
REMINDER_TEXT=$2

if [[ "${REMINDER_TIME}" = *":"*  ]]; then
  REMINDER_TIMESTAMP=$(date -d "${REMINDER_TIME}" +%s)
else
  REMINDER_TIMESTAMP=$(($(date +%s) + ((${REMINDER_TIME} * 60))))
fi

${SCRIPT_DIR}/schedule_notification.sh ${REMINDER_TIMESTAMP} ${REMINDER_TEXT} &
disown

