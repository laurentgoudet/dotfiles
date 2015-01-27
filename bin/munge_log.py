#!/usr/bin/env python

ORIG = '/usr/share/zoneinfo/US/Western'
TO = '/usr/share/zoneinfo/Australia/Sydney'
import os
import re
import sys
import time
def convtime(match):
    os.environ['TZ'] = ORIG
    time.tzset()
    t = time.strptime(match.group(0), '%H:%M:%S')
    t = time.mktime(t)
    os.environ['TZ'] = TO
    time.tzset()
    return time.strftime('%H:%M:%S', time.localtime(t))

while True:
    try:
        line = sys.stdin.readline()
    except KeyboardInterrupt:
        break
    line = re.sub(r'\d\d-\w\w\w-\d\d\d\d \d\d:\d\d:\d\d UTC', convtime, line)
    line = line.replace('/gaf/www/content/gaf-cvs/', '')
    line = line.replace('public/', '')
    sys.stdout.write(line)
