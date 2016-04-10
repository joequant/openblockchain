#!/bin/bash
go get github.com/joequant/openblockchain/examples/map
cd $GOPATH/src/github.com/joequant/openblockchain/examples/map
go build
cd /hyperledger/core/container
go test -run BuildImage_Peer -timeout 99999s

cd ~
export TARFILE=go-ipfs_v0.3.11_linux-amd64.tar.gz
wget http://dist.ipfs.io/go-ipfs/v0.3.11/$TARFILE
tar xzf $TARFILE
sudo mv go-ipfs/ipfs /opt/go/bin/ipfs
rm -rf $TARFILE go-ipfs
