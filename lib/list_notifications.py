#!/usr/bin/env python3

import subprocess

ps = subprocess.Popen(['ps', 'aux'], stdout=subprocess.PIPE).communicate()[0].decode()
processes = ps.split("\n")
number_of_fields = len(processes[0].split()) - 1
for p in processes:
    if "schedule_notification.sh" in p:
        columns = p.split(None, number_of_fields)
        print("PID {}: {}".format(columns[1], columns[number_of_fields]))
