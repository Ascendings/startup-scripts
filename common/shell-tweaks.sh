#!/bin/bash

## Add/run shell tweaks for awesome things

# create my bin dir and add it to my .bashrc
mkdir ~/bin
echo -e 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
echo -e '' >> ~/.bashrc

# add Go path stuff to my .bashrc file
echo -e 'export GOPATH=$HOME/go' >> ~/.bashrc
echo -e 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
echo -e '' >> ~/.bashrc

# source my new .bashrc file
source ~/.bashrc
