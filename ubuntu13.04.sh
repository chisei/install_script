#!/bin/bash

# install script for ubuntu13.04

USER=$(id --user --name) # user name
GROUP=$(id --group --name) # group name

# prepared install for jenkins
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins-ci.org/debian binary/ > /etc/apt/sources.list.d/jenkins.list'

# basic package
sudo apt-get update
sudo apt-get install -y \
    automake \
    pkg-config \
    libpcre3-dev \
    zlib1g-dev \
    liblzma-dev \
    tmux \
    openssh-server \
    vim \
    curl \
    openssl \
    git-core \
    php5 \
    libmcrypt4 \
    php5-mcrypt \
    php5-curl \
    jenkins \
    rbenv \
    mysql-server \
    zsh

# chsh to zsh
sudo chsh -s /usr/bin/zsh $USER

# my configurations
git clone https://github.com/chisei/dotfiles.git ~/

# oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# install of ag
git clone https://github.com/ggreer/the_silver_searcher ~/
cd the_silver_searcher
./build.sh
sudo make install

# phpenv
git clone https://github.com/CHH/phpenv.git
bash ~/phpenv/bin/phpenv-install.sh

# php-build
git clone https://github.com/CHH/php-build.git ~/
sudo bash php-build/install.sh
sudo chmod $USER:$GROUP /usr/local/share/php-build
