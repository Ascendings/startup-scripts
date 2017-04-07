#!/bin/bash

## Make sure we're root before we start to do anything
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi


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
#add-apt-repository ppa:webupd8team/atom

# Nextcloud client repo
#apt-add-repository ppa:nextcloud-devs/client

# Node.js repo
curl -sL https://deb.nodesource.com/setup_7.x | -E bash -

# Noobslab theme repos
#add-apt-repository ppa:noobslab/themes
#add-apt-repository ppa:snwh/pulp

# Opera repo
echo 'deb https://deb.opera.com/opera-stable/ stable non-free' | tee -a /etc/apt/sources.list.d/opera.list
wget -qO - https://deb.opera.com/archive.key | apt-key add -

# Runescape Unix Client repo
#echo "deb http://ppa.launchpad.net/hikariknight/unix-runescape-client/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/unix-runescape-client.list
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9BA73CFA
add-apt-repository ppa:hikariknight/unix-runescape-client
sed -i "s/$()/trusty/g" /etc/apt/sources.list.d/some-ppa-wheezy.list

# Virtualbox repo
echo 'deb http://download.virtualbox.org/virtualbox/debian yakkety contrib' | tee -a /etc/apt/sources.list.d/virtualbox.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -

# Vivaldi repo
echo 'deb http://repo.vivaldi.com/stable/deb/ stable main' | tee -a /etc/apt/sources.list.d/vivaldi.list
wget -qO - http://repo.vivaldi.com/stable/linux_signing_key.pub | apt-key add -

# Update repository sources
apt update && apt --yes upgrade

# install our packages
apt -y install \
    chromium \
    cinnamon-desktop-environment \
    clementine \
#    dark-aurora \
    dkms \
    filezilla \
    fonts-roboto \
    gcc \
    gimp \
    git \
    gnome-shell \
    gnome-tweak-tool \
    golang \
#    nextcloud-client \
    nmap \
    nodejs \
    openjdk-7-jre \
    openjdk-7-jdk \
    opera-stable \
#    paper-cursor-theme \
#    paper-gtk-theme \
#    paper-icon-theme \
    php5-cli \
    php5-ldap \
    php5-mysqlnd \
    php5-pgsql \
    python-pip \
    python-software-properties \
    python3 \
    python3-pip \
    remmina \
    remmina-plugin-rdp \
    ruby \
    ruby-dev \
#    rustc \
    software-properties-common \
    sqlitebrowser \
#    steam \
    thunderbird \
    transmission \
    unix-runescape-client \
    vim \
    virt-manager \
    virtualbox-5.1 \
    vivaldi-stable \
    vlc \
    wireshark \
    xclip

# install global node.js packages
npm install -g \
    coffeescript \
    express-generator \
    nodemon

# install global Ruby gems
gem install sass

# install Go binaries 
go get github.com/gpmgo/gopm
go get github.com/mattn/gom
go get github.com/unknwon/bra


## Other system tweaks
# set systemd to use local timezone
timedatectl set-local-rtc 1

# Remove any uneeded packages
apt-get autoremove

