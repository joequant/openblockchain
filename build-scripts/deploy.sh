#!/bin/bash
export OPENCHAIN_PEER_ADDRESS=172.17.0.2:30303
cd $GOPATH/src/github.com/openblockchain/obc-peer
./obc-peer chaincode deploy -p github.com/joequant/openblockchain/examples/map -c '{"Function":"init", "Args":[]}'
./obc-peer chaincode deploy -p github.com/joequant/openblockchain/examples/chaincode_example02 -c '{"Function":"init", "Args": ["a","100", "b", "200"]}'
