#!/bin/sh
export NORMAL_LED="/sys/class/gpio_sw/normal_led/data"
export STANDBY_LED="/sys/class/gpio_sw/standby_led/data"
echo 1 >> "${NORMAL_LED}"
echo 1 >> "${STANDBY_LED}"
sleep 0.3
echo 0 >> "${NORMAL_LED}"
sleep 0.3
echo 0 >> "${STANDBY_LED}"
sleep 0.2
echo 1 >> "${NORMAL_LED}"
echo 1 >> "${STANDBY_LED}"
sleep 0.1
echo 0 >> "${NORMAL_LED}"
sleep 0.1
echo 0 >> "${STANDBY_LED}"
sleep 0.2
