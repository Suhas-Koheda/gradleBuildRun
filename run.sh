#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [android|ios|desktop]"
    exit 1
fi

device=$1

case $device in
    android)
        ./gradlew assembleDebug
        ./gradlew installDebug
        ./gradlew connectedDebugAndroidTest
        ;;
    ios)
        ./gradlew assembleIos
        ./gradlew installIos
        ;;
    desktop)
        ./gradlew assembleDesktop
        ./gradlew installDesktop
        ;;
    *)
        echo "Invalid option. Use 'android', 'ios', or 'desktop'."
        exit 1
        ;;
esac
