# Sensors dashboard

Shows my sensors on a grafana dashboard. Sensor data is scraped & stored by
prometheus.

# Prerequisites
- docker

# Run
```sh
# start all services:
./run.sh
# test subscribing and publishing to an MQTT topic:
docker run -it eclipse-mosquitto mosquitto_sub -h host.docker.internal -t 'wozsensors/lounge' -v
docker run -it eclipse-mosquitto mosquitto_pub -h host.docker.internal -t 'wozsensors/lounge' -m '{"temperature": 22.2}'
# see raw metrics at http://localhost:9641/metrics
# if you sent the above message, you should see a metric like:
# temperature{sensor="lounge",topic="wozsensors/lounge"} 22.9 1656816843918
# stop all services:
./stop.sh
```

# To do
- scrape metrics
- show metrics on grafana
