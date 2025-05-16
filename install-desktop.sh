#!/usr/bin/env sh

#
# Installer for desktop environment
#

source ./utils.sh

info "Installing hyprland and tools"
$PKG_INSTALL hyprland \
  hyprpaper \
  hyprlock \
  wofi \
  waybar \
  brightnessctl \
  playerctl
result

