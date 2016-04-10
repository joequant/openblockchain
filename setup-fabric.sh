#!/bin/bash
. env.sh
pushd  $GOPATH/src/github.com/hyperledger/fabric/devenv > /dev/null
vagrant destroy -f
popd > /dev/null

mkdir -p $GOPATH/src/github.com/hyperledger
pushd $GOPATH/src/github.com/hyperledger > /dev/null
git clone http://github.com/joequant/fabric.git
pushd fabric > /dev/null
git pull
popd > /dev/null
popd > /dev/null

pushd  $GOPATH/src/github.com/hyperledger/fabric/devenv > /dev/null
vagrant up
popd > /dev/null
$SCRIPT_DIR/run-script.sh build-scripts/devbuild.sh
