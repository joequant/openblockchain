#!/bin/bash
cd $GOPATH/src/github.com/hyperledger/fabric
go build -o peer

go test github.com/hyperledger/fabric/core/container -run=BuildImage_Peer
go test github.com/hyperledger/fabric/core/container -run=BuildImage_Obcca

cd ~
export TARFILE=go-ipfs_v0.3.11_linux-amd64.tar.gz
rm -f $TARFILE $TARFILE.*
wget http://dist.ipfs.io/go-ipfs/v0.3.11/$TARFILE
tar xzf $TARFILE
sudo mv go-ipfs/ipfs /opt/go/bin/ipfs
rm -rf $TARFILE go-ipfs
