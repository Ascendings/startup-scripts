#!/bin/bash

## Variables
CODE=$(bash <(cat /etc/os-release; echo 'echo ${UBUNTU_CODENAME/*, /}'))


## Shell tweaks
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


## Packages and updates
# Atom editor repo
sudo add-apt-repository --yes ppa:webupd8team/atom

# Nextcloud client repo
sudo apt-add-repository --yes ppa:nextcloud-devs/client

# Node.js repo
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# Noobslab theme repos
sudo add-apt-repository --yes ppa:noobslab/themes
sudo add-apt-repository --yes ppa:snwh/pulp

# Opera repo
echo 'deb https://deb.opera.com/opera-stable/ stable non-free' | sudo tee -a /etc/apt/sources.list.d/opera.list
wget -qO - https://deb.opera.com/archive.key | sudo apt-key add -

# Runescape Unix Client repo
sudo add-apt-repository --yes ppa:hikariknight/unix-runescape-client

# Virtualbox repo
echo "deb http://download.virtualbox.org/virtualbox/debian $CODE contrib" | sudo tee -a /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

# Vivaldi repo
echo 'deb http://repo.vivaldi.com/stable/deb/ stable main' | sudo tee -a /etc/apt/sources.list.d/vivaldi.list
wget -qO - http://repo.vivaldi.com/stable/linux_signing_key.pub | sudo apt-key add -

# Update our repositories and make sure the system is up-to-date
sudo apt update && sudo apt --yes upgrade

# install our packages
sudo apt -y install \
    atom \
    chromium-browser \
    cinnamon-desktop-environment \
    clementine \
    composer \
    dark-aurora \
    dkms \
    filezilla \
    fonts-roboto \
    gcc \
    gimp \
    git \
    gnome-shell \
    gnome-tweak-tool \
    golang \
    nextcloud-client \
    nmap \
    nodejs \
    openjdk-8-jre \
    openjdk-8-jdk \
    opera-stable \
    paper-cursor-theme \
    paper-gtk-theme \
    paper-icon-theme \
    php7.0-cli \
    php7.0-ldap \
    php7.0-mbstring \
    php7.0-mysql \
    php7.0-pgsql \
    python-pip \
    python3 \
    python3-pip \
    remmina \
    ruby \
    ruby-dev \
    rustc \
    sqlitebrowser \
    steam \
    thunderbird \
    transmission \
    unity-tweak-tool \
    unix-runescape-client \
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
go get gtihub.com/revel/cmd/revel


## Other system tweaks
# set systemd to use local timezone
sudo timedatectl set-local-rtc 1

# git settings
git config --global push.default simple

# Remove any uneeded packages
sudo apt autoremove

