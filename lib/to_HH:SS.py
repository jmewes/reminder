#!/usr/bin/env python3

import sys
import time

t = sys.argv[1]

if (":" in t):
    print(t)
else:
    now = time.time()
    later = now + int(t) * 60
    print(time.strftime('%H:%M', time.localtime(later)))
