#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd ${SCRIPT_DIR}

echo Make sure that you have already downloaded Simula
echo Put it in Downloads or software folder
export APP_PATH=$(find ~/Downloads -name 'Simula.nix' | head -n 1)
if [ -z "${APP_PATH}" ] ; then
	APP_PATH=$(find ~/software -name 'Simula.nix' | head -n 1)
fi
if [ -z "${APP_PATH}" ] ; then
	echo Error: You have not yet downloaded the application and put it in Downloads or software folder
	exit 1
fi

folder=$(dirname -- ${APP_PATH})

# Create launcher script
cp launch_simula.sh ${folder}/

export APP_NAME=Simula
export APP_PATH=${folder}/launch_simula.sh
export ICON_PATH=${folder}/icon.png

# Create desktop file
envsubst <../template/ubuntu_desktop_launcher.desktop >~/.local/share/applications/Simula.desktop

echo Desktop file installed
echo Now open Activity by Super key\(Windows key\) and search freeplane,
echo then right click it and choose add to favourite

