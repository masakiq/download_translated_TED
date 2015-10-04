#!/usr/bin/python
# -*- encoding: utf-8 -*-

import sys
import codecs
from datetime import date, datetime, time, timedelta

import simplejson as json

sys.stdin  = codecs.getreader('utf-8')(sys.stdin)
sys.stdout = codecs.getwriter('utf-8')(sys.stdout)

def timestr(timeobj):
    return timeobj.strftime('%H:%M:%S,') + '%03d' % (timeobj.microsecond // 1000)

def decorate(content):
    if '\n' in content:
        return content
    else:
        return content[0:25] + '\n' + content[25:]

def main():
    f = open(sys.argv[1], 'r')
    captions = json.load(f)['captions']
    for i, c in enumerate(captions):
        startTime = int(c['startTime'])
        duration = int(c['duration'])
        # TEDのスプラッシュの時間を加える
        startTime += 12000
        st = datetime.combine(date.today(), time(0, 0)) + timedelta(milliseconds=startTime)
        et = st + timedelta(milliseconds=duration)

        print u'%d\n%s --> %s\n%s\n' % (i+1, timestr(st), timestr(et), decorate(c['content']))

if __name__ == '__main__':
    main()
