#!/usr/bin/bash
IP = 10.29.28.2
/usr/local/bin/viking-vision/viking-vision.py 0 -a $IP -s Right &
/usr/local/bin/viking-vision/viking-vision.py 1 -a $IP -s Left &
