# Sensors dashboard

Shows my sensors on a grafana dashboard. Sensor data is scraped & stored by
prometheus.

# Prerequisites
- docker
- jq

# First run
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

Prometheus + grafana data is persisted in docker volumes. Prometheus stores
sensor data, while grafana stores your dashboards. Be careful before deleting
them!

To stop all running services, run `./stop.sh`.


# My sensors
This is my sensor setup.

Add scripts under cron/ to your crontab.

For remote sensors, see [rpi_zero_18b20_sensor](./rpi_zero_18b20_sensor/rpi_18b20.md).

# to do
- pin docker images to versions
- back up prometheus and grafana data
- automate adding crontabs: https://stackoverflow.com/questions/610839/how-can-i-programmatically-create-a-new-cron-job
