#!/bin/bash

echo "PID   | CMD"
echo "--------------------------"

for pid in /proc/[0-9]*; do
    pidnum=$(basename "$pid")
    if [[ -r "$pid/cmdline" ]]; then
        cmdline=$(tr '\0' ' ' < "$pid/cmdline")
        if [[ -n "$cmdline" ]]; then
            printf "%-5s | %s\n" "$pidnum" "$cmdline"
        fi
    fi
done