#!/bin/bash
USR="root"
HOME_PATH="/root"
RELEASE_URL="https://storage.googleapis.com/go-spacemesh-release-builds/v0.1.35/ubuntu-latest/go-spacemesh"
CLI_URL="https://github.com/spacemeshos/CLIWallet/releases/download/v0.0.1/cli_wallet_linux_amd64"
CONFIG_URL="https://storage.googleapis.com/spacecraft-data/tweedlelite130-archive/config.json"
UNIT_FILE_URL="https://raw.githubusercontent.com/c29r3/spacemesh-utils/main/spacemesh_node.service"
START_FILE="https://raw.githubusercontent.com/c29r3/spacemesh-utils/main/start_daemon.sh"
SERVICE_NAME="spacemesh_node.service"

systemctl stop $SERVICE_NAME
mkdir $HOME_PATH/spacemesh
cd $HOME_PATH/spacemesh

wget $RELEASE_URL -O spacemesh && chmod u+x spacemesh
wget $CLI_URL -O cli && chmod u+x cli
wget $CONFIG_URL -O tn01.json
wget $UNIT_FILE_URL -O /etc/systemd/system/$SERVICE_NAME
systemctl daemon-reload
wget $START_FILE -O start_daemon.sh && chmod u+x start_daemon.sh

rm -rf sm_data post_data
systemctl enable $SERVICE_NAME
systemctl start $SERVICE_NAME

