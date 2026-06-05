#!/bin/bash

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
LOG="/var/log/monitor/health.log"
STATUS="OK"

mkdir -p /var/log/monitor

# Check 1 — Is Nginx running?
if ! systemctl is-active --quiet nginx; then
    STATUS="CRITICAL"
    echo "$TIMESTAMP - CRITICAL - Nginx is NOT running" >> $LOG
fi

# Check 2 — Is Flask container running?
if ! docker ps | grep -q blog-platform; then
    STATUS="CRITICAL"
    echo "$TIMESTAMP - CRITICAL - Flask container is NOT running" >> $LOG
fi

# Check 3 — Does app respond?
if ! curl -sf http://localhost > /dev/null; then
    STATUS="CRITICAL"
    echo "$TIMESTAMP - CRITICAL - App is NOT responding" >> $LOG
fi

# Final status
if [ "$STATUS" = "OK" ]; then
    echo "$TIMESTAMP - OK - all systems up" >> $LOG
fi
