# Sensors dashboard

Shows my sensors on a grafana dashboard. Sensor data is scraped & stored by
prometheus.

# Prerequisites
- docker

# Run
```sh
# start all services
./run.sh
# stop all services
./stop.sh
```

# To do
- run a MQTT server
- expose MQTT topics as metrics
- scrape metrics
- show metrics on grafana
