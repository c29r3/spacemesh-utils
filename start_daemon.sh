#!/bin/bash

cd /root/spacemesh/ && \
 ./spacemesh --grpc-server --json-server --tcp-port 7153 --config ./tn01.json \
 -d ./sm_data \
 --coinbase $(cat /root/spacemesh/address.txt) \
 --start-mining \
 --post-datadir ./post_data \
 --metrics
