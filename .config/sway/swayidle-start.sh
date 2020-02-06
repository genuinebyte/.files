#!/bin/bash
# Exit code of pidof is 1 if the process isn't running
pidof swayidle
IDLE_RUNNING=$?
echo $IDLE_RUNNING

if [ $IDLE_RUNNING -eq 1 ]; then
	# Test swaylock to see if it's really "swaylock-effects". Will fail with
	# exit code of 1 if `--screenshots` doesn't exist, 0 if it does.
	swaylock --screenshots -v
	STATUS=$?
	TIMEOUT=600
	SWAYLOCK_CMD="swaylock -f -i $1/frozen_husky.jpg.png"

	if [ $STATUS -eq 0 ]; then
		SWAYLOCK_CMD="swaylock -f --screenshots --effect-blur 4x5 \
			--clock --indicator --timestr %H:%M --datestr %F"
	fi

	swayidle \
		-w timeout $TIMEOUT "$SWAYLOCK_CMD" \
		before-sleep "$SWAYLOCK_CMD"
fi
