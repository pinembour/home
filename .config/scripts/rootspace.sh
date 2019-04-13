#!/bin/bash
df -h | grep /dev/mapper/vg-arch | awk '{print $4}'
