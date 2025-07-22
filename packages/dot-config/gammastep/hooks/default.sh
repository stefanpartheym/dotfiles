#!/bin/sh
case $1 in
  # NOTE: Gammastep currently has no other event typ than `period-changed`.
  period-changed)
    exec notify-send "Gammastep" "Period changed to: $3"
    ;;
esac
