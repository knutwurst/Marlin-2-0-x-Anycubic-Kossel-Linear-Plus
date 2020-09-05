#!/bin/bash

VERSION_FILE="/Users/OKoester/Documents/Arduino/Marlin-2-0-x-Anycubic-Kossel-Linear-Plus/Marlin/src/inc/Version.h"
FIRMWARE_FOLDER="/Users/OKoester/Documents/Arduino/Marlin-2-0-x-Anycubic-Kossel-Linear-Plus/.pio/build/"
OUTPUT_FOLDER="/Users/OKoester/Desktop/KOSSEL_FIRMWARE"

CUSTOM_BUILD_VERSION=$(egrep -o "([0-9]{1,}\.)+[0-9]{1,}" $VERSION_FILE -m1 | tail -n1)

if [ -d "$$OUTPUT_FOLDER/v$CUSTOM_BUILD_VERSION" ]; then
    echo "$$OUTPUT_FOLDER/$CUSTOM_BUILD_VERSION already exists."
else 
    mkdir $OUTPUT_FOLDER/$CUSTOM_BUILD_VERSION
fi

echo "Knutwurst's Kossel Firmware Version: $CUSTOM_BUILD_VERSION"

cd $FIRMWARE_FOLDER
for dir in $FIRMWARE_FOLDER/*/
do
    dir=${dir%*/}
    echo ${dir##*/}
    cp ${dir##*/}/firmware.hex /$OUTPUT_FOLDER/$CUSTOM_BUILD_VERSION/${dir##*/}_v$CUSTOM_BUILD_VERSION.hex
done