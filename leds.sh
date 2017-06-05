#!/bin/sh
modprobe sunxi_ir_rx
modprobe gpio_sunxi
export NORMAL_LED="/sys/class/gpio_sw/normal_led/data"
export STANDBY_LED="/sys/class/gpio_sw/standby_led/data"
while true; do
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
done
