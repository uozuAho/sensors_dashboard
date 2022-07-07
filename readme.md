# Sensors dashboard

Shows my sensors on a grafana dashboard. Sensor data is scraped & stored by
prometheus.

# Prerequisites
- docker

# Run
Here's a quick start that will get temperature data from a mock sensor showing
on a grafana dashboard:

```sh
# start all services:
./run.sh
# test subscribing and publishing to an MQTT topic:
docker run -it eclipse-mosquitto mosquitto_sub -h host.docker.internal -t 'wozsensors/lounge' -v
docker run -it eclipse-mosquitto mosquitto_pub -h host.docker.internal -t 'wozsensors/lounge' -m '{"temperature": 22.2}'
# go to prometheus: http://localhost:9090
# search for 'temperature'
# go to grafana: http://localhost:3000
# log in: admin admin
# add prometheus as a data source: http://prometheus:9090
# add a dashboard + panel. Enter 'temperature' as the query, then run it
```

Prometheus + grafana data is persisted under grafana/ and prometheus/
directories. Prometheus stores sensor data, while grafana stores your
dashboards. Be careful before deleting them!

To stop all running services, run `./stop.sh`.
