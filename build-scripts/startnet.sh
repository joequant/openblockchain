#!/bin/bash

export MYDIR=`pwd`
docker run --rm -t -e CORE_VM_ENDPOINT=http://172.17.0.1:4243 -e CORE_PEER_ID=vp1 -e CORE_PEER_ADDRESSAUTODETECT=true hyperledger-peer ./peer peer --logging-level=debug >& $MYDIR/vp1.log &
docker run --rm -t -e CORE_VM_ENDPOINT=http://172.17.0.1:4243 -e CORE_PEER_ID=vp2 -e CORE_PEER_ADDRESSAUTODETECT=true -e CORE_PEER_DISCOVERY_ROOTNODE=172.17.0.2:30303 hyperledger-peer ./peer peer --logging-level=debug >& $MYDIR/vp2.log &
cat



