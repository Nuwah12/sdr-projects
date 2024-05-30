#!/bin/bash

####################
# This script simply uses netcat to listen on port 7355 (UDP) for I/Q data streams
# Then sox is used to parse the raw data into audio data
# Multimon-ng is used to decode this audio data
####################

PORT=7355

nc -l -u -p ${PORT} | \
sox -t raw -esigned-integer -b 16 -r 48000 - -esigned-integer -b 16 -r 22050 -t raw - | \
multimon-ng -t raw -a POCSAG512 -a POCSAG1200 -a POCSAG2400  -f alpha -
