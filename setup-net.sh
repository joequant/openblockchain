#!/bin/bash
. env.sh
pushd obc-dev-env > /dev/null
vagrant ssh -c /openchain/build-scripts/startnet.sh
popd > /dev/null
