#import "@preview/codly:1.3.0": *
#import "@preview/tiaoma:0.3.0"
#show: codly-init.with()
#show link: underline
#set document(author: "Lazzarin Tommaso", title: "ATCS Module 2 assignment report.")
#set heading(numbering: "1.")

Lazzarin Tommaso (n. 2197479), #datetime.today().display("[day]/[month]/[year]"). \
Repository containing the files for exercises 1 and 3: https://github.com/tlazzarin/atcs-2
= MQTT Excercise
Requirements:
- Broker A is accessible at `localhost:1883`
- Broker B is accessible at `localhost:1884`
- Both brokers must run simultaneously
- Each broker should have its own container name
```
services:
  broker-a:
    image: eclipse-mosquitto:latest
    container_name: broker-a
    ports:
      - "1883:1883"
  broker-b:
    image: eclipse-mosquitto:latest
    container_name: broker-b
    ports:
      - "1884:1883"
```
= Edge Impulse model
The objective of this model is to distinguish between a 5 Euro and a 10 Euro bill. To train it I have taken 150 pictures of 5 and 10 euro bills with varying background, lighting and angle. The dataset is divided in 85% training set and 15% test set. The model is based on *MobileNetV2 160x160 1.0 (no final dense layer, 0.1 dropout)* and has an accuracy of 85.19%. \
#align(center, tiaoma.qrcode("https://smartphone.edgeimpulse.com/classifier.html?apiKey=ei_c0f3de44cc2c80cf9516fd36527fcb9749bd3d8111219f7d&impulseId=1", options: (scale: 2.0)))
#link("https://smartphone.edgeimpulse.com/classifier.html?apiKey=ei_c0f3de44cc2c80cf9516fd36527fcb9749bd3d8111219f7d&impulseId=1")
= TIG Stack
The code for this excercise is available at https://github.com/tlazzarin/atcs-2/tree/main/atcs-tig-stack
#figure(
  image("Grafana.png")
)

This dashboard monitors the parameters of a PC such as its CPU load, available RAM and internal temperature.
There are four docker containers:
- #link("https://github.com/tlazzarin/atcs-2/blob/main/atcs-tig-stack/telegraf/telegraf.conf")[Telegraf]: gathers data from the system and also acts as an MQTT consumer, it then outputs the data to Influxdb.
- Influxdb: stores the data sent by Telegraf.
- Grafana: displays the data to the user.
- Mosquitto: MQTT broker for the simulated temperature sensor.
The temperature of the PC ("Host temperature" in the screenshot) is simulated by an #link("https://github.com/DamascenoRafael/mqtt-simulator-config")[MQTT simulator]#footnote(link("https://github.com/DamascenoRafael/mqtt-simulator-config")) with a #link("https://github.com/tlazzarin/atcs-2/blob/main/atcs-tig-stack/mqtt-simulator/settings.json")[custom configuration]#footnote(link("https://github.com/tlazzarin/atcs-2/blob/main/atcs-tig-stack/mqtt-simulator/settings.json")).
