#!/bin/bash
sudo snap install --classic go
echo 'export GOPATH=$HOME/go' >>~/.profile
echo 'export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin' >>~/.profile
echo 'alias refresh="cd $HOME/bash_scripts/;bash refresh.sh"' >>~/.profile
source ~/.profile
go get -u github.com/gobuffalo/packr/...
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install build-essential
sudo apt-get install -y nodejs
cd
go get github.com/Modulos/easeml
cd $GOPATH/src/github.com/;rm -rf ds3lab;mv Modulos/ ds3lab;
cd $GOPATH/src/github.com/ds3lab/easeml/web
npm install
npm install vue-apexcharts apexcharts
npm run build
cd $HOME; sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
cd $HOME; echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/4.0 multiverse" | sudo tee * /etc/apt/sources.list.d/mongodb-org-4.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org
mkdir mongo_dir
cd mongo_dir
mkdir db
mkdir log
cd ..
mongod --dbpath mongo_dir/db --logpath mongo_dir/log/log.log --fork
cd $HOME;curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -;sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt-get update
sudo apt install docker-ce
sudo usermod -aG docker ${USER}
su - ${USER}
