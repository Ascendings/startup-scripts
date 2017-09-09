#!/bin/bash

## Install language-specific packages

# install Python packages
sudo pip install sshuttle

# install global node.js packages
sudo npm install -g \
    coffeescript \
    express-generator \
    nodemon

# install global Ruby gems
sudo gem install sass
sudo gem install rails

# set the Go path for this script
export GOPATH=$HOME/go
# install Go binaries 
go get github.com/gpmgo/gopm
go get github.com/mattn/gom
go get github.com/unknwon/bra
go get gtihub.com/revel/cmd/revel