#!/bin/bash
cat /sys/devices/pci0000:00/0000:00:03.1/0000:0a:00.0/hwmon/hwmon2/temp1_input | cut -c 1-2
