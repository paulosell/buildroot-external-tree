#!/bin/bash
IMAGE_PATH=output/images/sdcard.img
DEV_PATH=/dev/sda

burn_sd() {
    printf "Burning sd card"

    dd if="$IMAGE_PATH" of="$DEV_PATH" status=progress 2>/dev/null &
    DD_PID=$!  # Capture the process ID of dd

    # Spinner animation
    SPINNER="/ - \\ |"
    while kill -0 $DD_PID 2>/dev/null; do
        for i in $SPINNER; do
            printf "\rBurning sd card %s" "$i"
            sleep 0.2
        done
    done

    wait $DD_PID
    if [ $? -ne 0 ]; then
        printf "\nError burning SD card... does %s exist?\n" "$DEV_PATH"
        return 1
    fi

    printf "\nOK\n"
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
