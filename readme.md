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
docker run -it eclipse-mosquitto mosquitto_sub -h host.docker.internal -t 'my/topic' -v
docker run -it eclipse-mosquitto mosquitto_pub -h host.docker.internal -t 'my/topic' -m 'yo'
# see raw metrics at http://localhost:9641/metrics
# stop all services:
./stop.sh
```

# To do
- expose a topic as metrics: https://github.com/hikhvar/mqtt2prometheus/pkgs/container/mqtt2prometheus
- scrape metrics
- show metrics on grafana
