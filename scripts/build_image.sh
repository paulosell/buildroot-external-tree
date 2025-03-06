#!/bin/bash

usage() {
  echo "Usage: $0 {clean_build}"

}

dirty_build() {
  cd buildroot/output || return 1
  if [ ! -f Makefile ]; then
    echo "ERROR: run make image_clean_build"
    return 1
  fi
  make
}

clean_build() {
  cd buildroot
  rm -rf output
  mkdir output
  cd output
  make O=$PWD -C /var/buildroot-2024.11.1 BR2_EXTERNAL=/home/devops/buildroot raspberrypi5_defconfig
  make
}

case "$1" in
  clean_build)
    clean_build
    ;;
  dirty_build)
    dirty_build
    ;;
  *)
    usage
    exit 1
esac
