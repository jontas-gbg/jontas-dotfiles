#!/usr/bin/env bash

# Gracefully terminate walker process using SIGTERM.
# If process remain, forcefully kill it with SIGKILL.
#
# jontas@gmx.com (2023, 2025)
# SPDX-License-Identifier: MIT

pkill walker
sleep 0.5
pgrep -x walker && pkill -KILL walker

uwsm app -- walker --gapplication-service > /dev/null 2>&1 &

