#!/bin/bash
cd /
mkdir -p opt
cd opt
git clone --depth 1 https://github.com/christianscheuer/sffs -b master
cd sffs
sudo chown -R $USER .
./install-alpine.sh
