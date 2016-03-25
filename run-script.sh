#!/bin/bash
. env.sh
pushd obc-dev-env > /dev/null
vagrant ssh -c /openchain/build-scripts/$1
popd > /dev/null
