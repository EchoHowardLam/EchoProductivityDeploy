#!/bin/bash

# default icon is obtained from
# https://www.flaticon.com/free-icons/mind-map

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd ${SCRIPT_DIR}

echo Make sure that you have already downloaded freeplane
echo Put it in Downloads or software folder
export FREEPLANE_PATH=$(find ~/Downloads -name 'freeplane.sh' | head -n 1)
if [ -z "${FREEPLANE_PATH}" ] ; then
	FREEPLANE_PATH=$(find ~/software -name 'freeplane.sh' | head -n 1)
fi
export ICON_PATH=$(realpath ./mind-map.png)
envsubst <freeplane.desktop >~/.local/share/applications/freeplane.desktop

echo Desktop file installed
echo Now open Activity by Super key\(Windows key\) and search freeplane,
echo then right click it and choose add to favourite

