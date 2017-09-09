#!/bin/bash

## Shell tweaks
bash common/shell-tweaks.sh

## Packages, repositories and updates
# check for any updates
sudo zypper up

# Add Adobe repository
sudo zypper ar --check --refresh http://linuxdownload.adobe.com/linux/x86_64/ adobe
# Install Adobe repository keys
sudo zypper install adobe-release-x86_64
sudo rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux

# Add Sublime Text repository
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
  188  sudo zypper addrepo -g -f https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

# Refresh zypper repositories before we start installing stuff
sudo zypper refresh

# install packages
sudo zypper install \
    arc-icon-theme \
    chrome-gnome-shell \
    chromium \
    cinnamon \
    clementine \
    dkms \
    flash-plugin \
    filezilla \
    firefox \
    gcc \
    gimp \
    git \
    gnome \
    gnome-tweak-tool \
    go \
    gtk2-metatheme-arc \
    gtk3-metatheme-arc \
    mate \
    mate-applets \
    mate-power-manager \
    mate-tweak-tool \
    nextcloud-client \
    nodejs \
    opera-stable \
    paper-icon-theme \
    php-composer \
    php7 \
    php7-gd \
    php7-json \
    php7-ldap \
    php7-mbstring \
    php7-mysql \
    php7-pgsql \
    python2 \
    python2-pip \
    python3 \
    python3-pip \
    ruby \
    ruby-devel \
    rust \
    sqlitebrowser \
    steam \
    sublime-text \
    synapse \
    thunderbird \
    transmission \
    vim \
    virt-manager \
    virtualbox \
    vlc \
    wireshark \
    xclip

## Install extra packages
bash common/extra-packages.sh

## Git setup
bash common/git-setup.sh

## Other system tweaks
# set systemd to use local timezone
sudo timedatectl set-local-rtc 1
