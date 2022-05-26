#!/bin/bash

which python3 > /dev/null || { echo "python3 not installed." ; exit 1 ; }

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

usage () {
     cat << EOF
DESCRIPTION:
  The purpose of this tool is to display popup notifications at specific times.

SYNOPSIS:
  reminder add <time> <message> [<url>]
  reminder list
  reminder stop <pid>
  reminder -h

ACTIONS:
  add       Add a new reminder
  list      Show scheduled reminders
  stop      Stop the reminder with the given process id.

OPTIONS:
  <time>    The time at which the popup notice is to be open in 24h format (HH:MM), e.g. 15:25.
  <message> The message to be displayed in the popup notice.
  <url>     The URL to be opened. On Linux the URL will open automatically with the default browser. On MacOS the URL will be rendered as link in the popup notification.
  <pid>     The operating system process id of the scheduled reminder.
  -h        Show this message.
EOF
}

ACTION=$1

if [[ -z "${ACTION}" || "${ACTION}" = "-h" ]]; then
    usage
    exit 0
fi

if [[ "${ACTION}" == "add" ]]; then
    REMINDER_TIME=$2
    REMINDER_TEXT=$3
    REMINDER_URL=$4

    if [[ ! "${REMINDER_TIME}" = *":"*  ]]; then
      REMINDER_TIME_IN_SECONDS=$(($(date +%s) + ((${REMINDER_TIME} * 60))))
      REMINDER_TIME=$(date -d @${REMINDER_TIME_IN_SECONDS} '+%H:%M')
    fi

    if [[ -z "${REMINDER_TEXT}" ]]; then
        REMINDER_TEXT=" "
    fi

    if [[ -n "${REMINDER_URL}" ]]; then
        if [[ ! "${REMINDER_URL}" = http* ]]; then
            echo "ERROR: Reminder URL '${REMINDER_URL}' has an invalid format." >&2
            exit 1
        fi
    fi

    nohup ${SCRIPT_DIR}/schedule_notification.sh -t ${REMINDER_TIME} -m "${REMINDER_TEXT}" -u "${REMINDER_URL}" > /dev/null 2>&1 &
    exit 0
fi

if [[ "${ACTION}" == "list" ]]; then
    
    ${SCRIPT_DIR}/lib/list_notifications.py
    exit 0
fi

if [[ "${ACTION}" == "stop" ]]; then
    kill -9 $2
    exit 0
fi

usage
exit 1
