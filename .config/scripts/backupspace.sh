#!/bin/bash
df -h | grep backup | awk '{print $4}'
