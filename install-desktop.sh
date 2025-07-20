#!/usr/bin/env sh

#
# Installer for desktop environment
#

source ./utils.sh

info "Installing display manager and wayland session manager"
$PKG_INSTALL ly uwsm
result

info "Installing window manager and tools"
$PKG_INSTALL \
  hyprland \
  hyprsunset hyprpicker hyprshot hyprpaper hyprlock hypridle hyprpolkitagent hyprland-qtutils \
  xdg-desktop-portal-hyprland xdg-desktop-portal-gtk qt6-wayland qt5-wayland \
  wofi \
  waybar \
  swaync \
  wlogout \
  pavucontrol brightnessctl playerctl \
  pacman-contrib
result

info "Installing theming packages"
$PKG_INSTALL gnome-themes-extra nwg-look
result

info "Installing clipboard manager"
$PKG_INSTALL wl-clipboard clipse
result

info "Installing terminal emulator"
$PKG_INSTALL ghostty
result

info "Installing file manager"
$PKG_INSTALL nautilus
result

info "Installing bluetooth manager"
$PKG_INSTALL blueberry
result

info "Installing differ"
$PKG_INSTALL meld
result

info "Installing credentials manager and keyring"
$PKG_INSTALL gnome-keyring libsecret
result

info "Installing git credentials manager"
$PKG_INSTALL git-credential-manager-bin
result
