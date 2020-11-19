#!/bin/bash
USR="root"
HOME_PATH="/root"
RELEASE_URL="https://storage.googleapis.com/smapp/testnet_120/go-spacemesh-linux"
CLI_URL="https://github.com/spacemeshos/CLIWallet/releases/download/v0.0.1/cli_wallet_linux_amd64"
CONFIG_URL="https://storage.googleapis.com/smapp/testnet_120/config_netid_120.json"
UNIT_FILE_URL="https://raw.githubusercontent.com/c29r3/spacemesh-utils/main/spacemesh_node.service"
START_FILE="https://raw.githubusercontent.com/c29r3/spacemesh-utils/main/start_daemon.sh"
SERVICE_NAME="spacemesh_node.service"

mkdir $HOME_PATH/spacemesh
cd $HOME_PATH/spacemesh

wget $RELEASE_URL -O spacemesh && chmod u+x spacemesh
wget $CLI_URL -O cli && chmod u+x cli
wget $CONFIG_URL -O tn01.json
wget $UNIT_FILE_URL -O /etc/systemd/system/$SERVICE_NAME
wget $START_FILE -O start_daemon.sh && chmod u+x start_daemon.sh

systemctl stop $SERVICE_NAME
rm -rf sm_data post_data
systemctl daemon-reload
systemctl enable $SERVICE_NAME
systemctl start $SERVICE_NAME

