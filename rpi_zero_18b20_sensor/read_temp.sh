#!/bin/bash

SENSOR_FILE=/sys/bus/w1/devices/28-01144007f4aa/w1_slave
MQTT_BROKER_IP=192.168.1.103

function read_temp {
  cat $SENSOR_FILE | grep -Eo "t=.*" | tr -d 't='
}

function div1000 {
  python -c '
import fileinput

for line in fileinput.input():
  print(float(line)/1000)
'
}

function publish_temp {
  temp=$(cat -)
  mosquitto_pub -h $MQTT_BROKER_IP -t 'wozsensors/desk' -m "{\"temperature\": ${temp}}"
}

read_temp | div1000 | publish_temp
