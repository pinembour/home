#!/bin/bash
~/.config/sway/idle/pulse.sh || exit 1

swaylock-blur --blur-sigma 60 -- -f
