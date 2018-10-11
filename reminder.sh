#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

REMINDER_TIMER=$1
REMINDER_TEXT=$2

nohup ${SCRIPT_DIR}/schedule_notification.sh ${REMINDER_TIMER} ${REMINDER_TEXT} &
