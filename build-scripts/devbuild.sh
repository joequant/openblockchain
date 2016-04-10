#!/bin/bash
cd /hyperledger/core/container
go test -run BuildImage_Peer -timeout 99999s

cd ~
export TARFILE=go-ipfs_v0.3.11_linux-amd64.tar.gz
rm -f $TARFILE.*
wget http://dist.ipfs.io/go-ipfs/v0.3.11/$TARFILE
tar xzf $TARFILE
sudo mv go-ipfs/ipfs /opt/go/bin/ipfs
rm -rf $TARFILE go-ipfs
