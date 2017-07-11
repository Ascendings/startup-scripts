#!/bin/bash

## Variables
VER=$(cat /etc/debian_version | cut -d '.' -f 1)
PHP_VERS="5"
if [ $VER = 7 ]; then
  CODE="wheezy"
elif [ $VER = 8 ]; then
  CODE="jessie"
elif [ $VER = 9 ]; then
  CODE="stretch"
  PHP_VERS="7.0"
fi


## Shell tweaks
# create my bin dir and add it to my .bashrc
mkdir ~/bin
echo -e '' >> ~/.bashrc
echo -e '# add home bin/ dir to my path' >> ~/.bashrc
echo -e 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc
echo -e '' >> ~/.bashrc

# add Go path stuff to my .bashrc file
echo -e '# add Go stuff to my path' >> ~/.bashrc
echo -e 'export GOPATH=$HOME/go' >> ~/.bashrc
echo -e 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc
echo -e '' >> ~/.bashrc

# source my new .bashrc file
source ~/.bashrc


## Packages and updates
# we need these packages first
sudo apt -y install apt-transport-https curl


## Repositories
# Node.js repo
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# Opera repo
echo 'deb https://deb.opera.com/opera-stable/ stable non-free' | sudo tee -a /etc/apt/sources.list.d/opera.list
wget -qO - https://deb.opera.com/archive.key | sudo apt-key add -

# Virtualbox repo
echo "deb http://download.virtualbox.org/virtualbox/debian $CODE contrib" | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

# Vivaldi repo
echo 'deb http://repo.vivaldi.com/stable/deb/ stable main' | sudo tee -a /etc/apt/sources.list.d/vivaldi.list
wget -qO - http://repo.vivaldi.com/stable/linux_signing_key.pub | sudo apt-key add -

# Update repository sources
sudo apt update && sudo apt --yes upgrade

# install our packages
sudo apt -y install \
    chromium \
    cinnamon-desktop-environment \
    clementine \
    dkms \
    filezilla \
    gcc \
    gimp \
    git \
    gnome-shell \
    gnome-tweak-tool \
    golang \
    nmap \
    nodejs \
    opera-stable \
    php"$PHP_VERS"-cli \
    php"$PHP_VERS"-ldap \
    php"$PHP_VERS"-mysqlnd \
    php"$PHP_VERS"-pgsql \
    python-pip \
    ruby \
    ruby-dev \
    software-properties-common \
    sqlitebrowser \
    thunderbird \
    transmission \
    vim \
    virt-manager \
    virtualbox-5.1 \
    vivaldi-stable \
    vlc \
    wireshark \
    xclip

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

# install Go binaries 
go get github.com/gpmgo/gopm
go get github.com/mattn/gom
go get github.com/unknwon/bra
go get github.com/revel/cmd/revel


## Other system tweaks
# set systemd to use local timezone
sudo timedatectl set-local-rtc 1

# Git configuration
git config --global push.default simple

# Remove any uneeded packages
sudo apt-get autoremove

