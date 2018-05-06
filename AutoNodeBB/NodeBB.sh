#!/bin/bash
apt update && apt upgrade -y
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
apt install -y nodejs mongodb nginx
git clone -b v1.8.x https://github.com/NodeBB/NodeBB.git nodebb
cd nodebb
./nodebb install
echo "Finish.(https://github.com/N0ug4t/AutoInstallNodeBB)"
