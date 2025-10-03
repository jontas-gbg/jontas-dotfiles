#!/usr/bin/env bash

# A simple timer called from an alias named 'st' like "st 3m" or "st 1h"
# jontas@gmx.com in 2022, updated in 2024 using notify-send for dialog box.

if [ $# -eq 0 ]; then
    notify-send -t 3000 "Specify countdown time"
    exit 1
fi

time_arg=$1
message="${@:2}"

(sleep "$time_arg" && notify-send -t 6000 "$message") &
