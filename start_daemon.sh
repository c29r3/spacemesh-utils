#!/bin/bash

cd /root/spacemesh/ && \
 ./spacemesh --grpc-server --json-server --tcp-port 7153 --config ./tn01.json \
 -d ./sm_data \
 --coinbase $SPACEMESH_ADDRESS \
 --start-mining \
 --post-datadir ./post_data \
 --metrics
