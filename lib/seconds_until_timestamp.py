#!/usr/bin/env python3

import sys
import time
import re
import datetime

def to_seconds(t):
    return int(datetime.timedelta(hours=t.hour, minutes=t.minute, seconds=t.second).total_seconds())

t = sys.argv[1]

m = re.match("(\d+):(\d+)", t)
hour = int(m.group(1))
minute = int(m.group(2))

later = datetime.time(hour, minute)
later = to_seconds(later)

now = datetime.datetime.now()
now = to_seconds(now)

print(later - now)
