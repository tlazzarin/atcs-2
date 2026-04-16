#import "@preview/codly:1.3.0": *
#import "@preview/tiaoma:0.3.0"
#show: codly-init.with()
#show link: underline
#set document(author: "Lazzarin Tommaso", title: "ATCS Module 2 assignment report.")
#set heading(numbering: "1.")

Lazzarin Tommaso, #datetime.today().display("[day]/[month]/[year]"). \
Repository containing the configuration files: https://github.com/tlazzarin/atcs-2
= MQTT Excercise
Requirements:
- Broker A is accessible at `localhost:1883`
- Broker B is accessible at `localhost:1884`
- Both brokers must run simultaneously
- Each broker should have its own container name
The docker-compose.yml file of this excercise is available at #link("https://github.com/tlazzarin/atcs-2/blob/main/mqtt-demo/docker-compose.yml")
= Edge Impulse model
The objective of this model is to distinguish between a 5 Euro and a 10 Euro bill.\
#link("https://smartphone.edgeimpulse.com/classifier.html?apiKey=ei_c0f3de44cc2c80cf9516fd36527fcb9749bd3d8111219f7d")
#tiaoma.qrcode("https://smartphone.edgeimpulse.com/classifier.html?apiKey=ei_c0f3de44cc2c80cf9516fd36527fcb9749bd3d8111219f7d", options: (scale: 2.0))
= TIG Stack
The code for this excercise is available at https://github.com/tlazzarin/atcs-2/tree/main/atcs-tig-stack
#figure(
  image("Grafana.png")
)

This dashboard monitors the parameters of a PC such as its CPU load, available RAM and internal temperature.
There are four docker containers:
- #link("https://github.com/tlazzarin/atcs-2/blob/main/atcs-tig-stack/telegraf/telegraf.conf")[Telegraf]: gathers data from the system and also acts as an MQTT consumer then outputs the data to Influxdb.
- Influxdb: stores the data sent by Telegraf.
- Grafana: shows the data to the user.
- Mosquitto: MQTT broker for the simulated temperature sensor.
The temperature of the PC ("Host temperature" in the screenshot) is simulated by an #link("https://github.com/DamascenoRafael/mqtt-simulator-config")[MQTT simulator] with a #link("https://github.com/tlazzarin/atcs-2/blob/main/atcs-tig-stack/mqtt-simulator/settings.json")[custom configuration].
