#!/bin/bash

# default icon is obtained from
# https://www.flaticon.com/free-icons/mind-map

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd ${SCRIPT_DIR}

echo Make sure that you have already downloaded freeplane
echo Put it in Downloads or software folder
export APP_PATH=$(find ~/Downloads -name 'freeplane.sh' | head -n 1)
if [ -z "${APP_PATH}" ] ; then
	APP_PATH=$(find ~/software -name 'freeplane.sh' | head -n 1)
fi
if [ -z "${APP_PATH}" ] ; then
	echo Error: You have not yet downloaded the application and put it in Downloads or software folder
	exit 1
fi

export APP_NAME=Freeplane
export ICON_PATH=$(realpath ./mind-map.png)

# Create desktop file
envsubst <../template/ubuntu_desktop_launcher.desktop >~/.local/share/applications/freeplane.desktop

echo Desktop file installed
echo Now open Activity by Super key\(Windows key\) and search freeplane,
echo then right click it and choose add to favourite

