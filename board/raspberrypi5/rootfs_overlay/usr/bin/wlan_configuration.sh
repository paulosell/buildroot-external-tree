#!/bin/sh

SSID=$1
PASSPHRASE=$2
CONFIG_FILE="/etc/wpa_supplicant.conf"

usage() {
  echo "Usage $0 ssid passphrase"
}

if [[ -z "$SSID" ]]; then
    echo "SSID cannot be empty."
    exit 1
fi

if [[ -z "$PASSPHRASE" ]]; then
    echo "Passphrase cannot be empty."
    exit 1
fi

sed -i "s|ssid=.*|ssid=\"$SSID\"|" "$CONFIG_FILE"
sed -i "s|psk=.*|psk=\"$PASSPHRASE\"|" "$CONFIG_FILE"

/sbin/ifdown wlan0
wpa_supplicant -B -Dnl80211,wext -i wlan0 -c /etc/wpa_supplicant.conf
/sbin/ifup wlan0

exit 0
