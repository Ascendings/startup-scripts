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
bash common/shell-tweaks.sh

## Packages and updates
# we need these packages first
sudo apt -y install apt-transport-https curl

## Repositories
# Arc theme repo via OBS (only if using Jessie)
if [[ "$CODE" == "jessie" ]]; then
  echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/ /' > /etc/apt/sources.list.d/arc-theme.list 
fi

# Node.js repo
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# Opera repo
echo 'deb https://deb.opera.com/opera-stable/ stable non-free' | sudo tee -a /etc/apt/sources.list.d/opera-stable.list
wget -qO - https://deb.opera.com/archive.key | sudo apt-key add -

# Sublime Text 3 repo
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

# Virtualbox repo
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
echo "deb http://download.virtualbox.org/virtualbox/debian $CODE contrib" | sudo tee -a /etc/apt/sources.list.d/virtualbox.list

# Vivaldi repo
wget -qO - http://repo.vivaldi.com/stable/linux_signing_key.pub | sudo apt-key add -
echo 'deb http://repo.vivaldi.com/stable/deb/ stable main' | sudo tee -a /etc/apt/sources.list.d/vivaldi.list

# Update repository sources
sudo apt update && sudo apt --yes upgrade

# install our packages
sudo apt -y install \
    arc-theme \
    audacity \
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
    guvcview \
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
    sublime-text \
    thunderbird \
    transmission \
    vim \
    virt-manager \
    virtualbox-5.1 \
    vivaldi-stable \
    vlc \
    wireshark \
    xclip \
    zlib1g-dev

## Install extra packages
bash common/extra-packages.sh

## Git setup
bash common/git-setup.sh

## Other system tweaks
# set systemd to use local timezone
sudo timedatectl set-local-rtc 1

# Remove any uneeded packages
sudo apt-get autoremove
