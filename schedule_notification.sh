#!/bin/bash

which python3 > /dev/null || { echo "python3 not installed." ; exit 1 ; }

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

usage () {
     cat << EOF
DESCRIPTION:
This script will sleep until the specified time and then display a popup
notification with the tools available for the respective operating system.

SYNOPSIS:
$0 -m message -t time [-u url]

OPTIONS:
    -m   The message to be displayed in the popup notice.
    -t   The time at which the popup notice is to be open in 24h format (HH:MM), e.g. 15:25.
    -u   The URL to be linked in the popup notice.
    -h   Show this message.
    -?   Show this message.
EOF
}

while getopts "m: t: u: h ?" option ; do
     case $option in
          m)   MESSAGE="${OPTARG}"
               ;;
          t)   TIME="${OPTARG}"
               ;;
          u)   URL="${OPTARG}"
               ;;
          h )  usage
               exit 0;;
          ? )  usage
               exit 0;;
     esac
done

if [[ -z ${MESSAGE} ]]; then
    echo "ERROR: parameter '-m' not set"
    usage
    exit 1
fi

if [[ -z ${TIME} ]]; then
    echo "ERROR: parameter '-t' not set"
    usage
    exit 1
fi

sleep $(${SCRIPT_DIR}/lib/seconds_until_timestamp.py ${TIME})

if [[ "$OSTYPE" == "darwin"* ]]; then
    if [[ -n ${URL} ]]; then
        terminal-notifier -title "Reminder" -message "$MESSAGE" -open "$URL"
    else
        terminal-notifier -title "Reminder" -message "$MESSAGE"
    fi
else
    notify-send  -u critical -t 0 "Reminder" "$MESSAGE"
    if [[ -n ${URL} ]]; then
        xdg-open "${URL}"
    fi
fi
