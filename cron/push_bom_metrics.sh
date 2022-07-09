#!/bin/bash
#
# Read air temperature from the BOM's Olympic Park station,
# push to prometheus.
#
# BOM data is updated every 30 minutes.
#
# Station info: http://reg.bom.gov.au/products/IDV60901/IDV60901.95936.shtml

BOM_STATION_DATA=http://reg.bom.gov.au/fwo/IDV60901/IDV60901.95936.json
PROMETHEUS_PUSH_GATEWAY=http://localhost:9091

air_temp=$(curl -s ${BOM_STATION_DATA} | jq '.observations.data[0].air_temp')

cat <<EOF | curl --data-binary @- ${PROMETHEUS_PUSH_GATEWAY}/metrics/job/bom_metrics
# TYPE air_temp gauge
# HELP air_temp air temperature at a local weather station
air_temp ${air_temp}
EOF
