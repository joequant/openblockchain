#!/bin/bash
. env.sh
cd golang/src/github.com/hyperledger/fabric/devenv
vagrant ssh -c /local-dev/$1

