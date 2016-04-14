#!/bin/bash
. env.sh
if [ -d $GOPATH/src/github.com/hyperledger/fabric/devenv ] ; then
    pushd  $GOPATH/src/github.com/hyperledger/fabric/devenv > /dev/null
    vagrant destroy -f
    popd > /dev/null
fi

mkdir -p $GOPATH/src/github.com/hyperledger
pushd $GOPATH/src/github.com/hyperledger > /dev/null
if [ ! -d fabric ] ; then
    git clone http://github.com/joequant/fabric.git
fi
pushd fabric > /dev/null
    git checkout .
popd > /dev/null
popd > /dev/null
if [ -f $SCRIPT_DIR/workaround.patch ] ; then
    pushd $GOPATH/src/github.com/hyperledger/fabric > /dev/null
    patch -p1 < $SCRIPT_DIR/workaround.patch
    popd > /dev/null
fi


pushd  $GOPATH/src/github.com/hyperledger/fabric/devenv > /dev/null
vagrant up
popd > /dev/null
$SCRIPT_DIR/run-script.sh build-scripts/devbuild.sh
$SCRIPT_DIR/vagrant-fabric.sh reload
