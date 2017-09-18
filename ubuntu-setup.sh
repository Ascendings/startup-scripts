#!/bin/bash

## Variables
CODE=$(bash <(cat /etc/os-release; echo 'echo ${UBUNTU_CODENAME/*, /}'))

## Shell tweaks
bash common/shell-tweaks.sh

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
echo 'deb https://deb.opera.com/opera-stable/ stable non-free' | sudo tee -a /etc/apt/sources.list.d/opera-stable.list
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
    audacity \
    arc-theme \
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
    guvcview \
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
    synapse \
    thunderbird \
    transmission \
    unix-runescape-client \
    vim \
    virt-manager \
    virtualbox-5.1 \
    vivaldi-stable \
    vlc \
    wireshark \
    xclip \
    zlib1g-dev

## Install extra, language-specific packages
bash common/extra-packages.sh

## Set up my git directory
bash common/git-setup.sh

## Other system tweaks
# set systemd to use local timezone
sudo timedatectl set-local-rtc 1

# Remove any uneeded packages
sudo apt autoremove

