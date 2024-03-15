#!/bin/bash

function check_root() {
  if [[ $EUID != 0 ]]; then
    echo ">>> Please execute with root privileges."
    exit 1
  fi
}

uninstall_vortex_agent() {
  if [ -f "/etc/systemd/system/vortex.service" ]; then
    systemctl stop vortex
    systemctl disable vortex
    rm /etc/systemd/system/vortex.service
  fi

  if [ -f "/usr/bin/vortex" ]; then
    rm /usr/bin/vortex
  fi

  if [ -d "/etc/vortex" ]; then
    rm -r /etc/vortex
  fi

  echo ">>> vortex service uninstalled successfully"
}

uninstall_gost() {
  if [ -f "/etc/systemd/system/gost.service" ]; then
    systemctl stop gost
    systemctl disable gost
    rm /etc/systemd/system/gost.service
  fi

  if [ -f "/usr/bin/gost" ]; then
    rm /usr/bin/gost
  fi

  if [ -d "/etc/gost" ]; then
    rm -r /etc/gost
  fi

  echo ">>> gost service uninstalled successfully"
}

check_root
uninstall_vortex_agent
uninstall_gost

echo ">>> Uninstall completed"
