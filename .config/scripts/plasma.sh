#!/bin/bash
	export XDG_SESSION_TYPE=wayland && 
	export $(dbus-launch) && 
	startplasmacompositor
