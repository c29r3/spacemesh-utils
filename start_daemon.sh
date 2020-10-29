#!/bin/bash

cd /root/spacemesh/ && \
 ./spacemesh --grpc-server --json-server --tcp-port 7153 --config ./tn01.json \
 -d ./sm_data \
 --coinbase $(addr=$(cat accounts.json | jq -r .ss.pubkey); echo 0x${addr:24}) \
 --start-mining \
 --post-datadir ./post_data \
 --metrics
