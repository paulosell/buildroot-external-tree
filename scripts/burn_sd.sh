#!/bin/bash
IMAGE_PATH=output/images/sdcard.img
DEV_PATH=/dev/sda

burn_sd() {
    echo "Burning sd card"
    dd if=$IMAGE_PATH of=$DEV_PATH status=progress 2>/dev/null 
    if [ $? -eq 1 ]; then
      echo "Error burning SD card... does $DEV_PATH exist?"
      return 1
    fi 
}

# Get all mounted partitions of /dev/sda
mounted_partitions=$(mount | grep "^$DEV_PATH" | awk '{print $1}')

# Check if there are any mounted partitions
if [ -z "$mounted_partitions" ]; then
    burn_sd
    if [ $? -eq 1 ]; then
      exit 1
    fi
    eject $DEV_PATH
    exit 0
fi

# Unmount each partition
for partition in $mounted_partitions; do
    umount "$partition" 2>/dev/null
done

burn_sd
eject $DEV_PATH
exit 0
