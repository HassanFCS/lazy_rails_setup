#!/bin/bash

echo "Updating system packages...\n"
sudo apt update

echo "\nUpgrading system packages...\n"
sudo apt upgrade -y

echo "\nInstalling gnupg2...\n"
sudo apt install gnupg2

echo "\nInstalling curl (in case it doesn't exist)...\n"
sudo apt install curl

echo "\nAdding rvm gpg2 key...\n"
gpg2 --keyserver hkp://keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

echo "\nSetting up rvm.sh...\n"
\curl -sSL https://get.rvm.io -o rvm.sh
cat rvm.sh | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 3.0.0

echo "\nSetting up Yarn...\n"
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo "\nSetting up NVM...\n"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

echo "\nRunning sudo apt update...\n"
sudo apt update

echo "\nInstalling Postgres...\n"
sudo apt install -y postgresql postgresql-contrib libpq-dev software-properties-common

echo "\nInstalling Yarn...\n"
sudo apt install -y yarn

echo "\nReloading bash config...\n"
source ~/.bashrc

echo "\nInstallling Rails 6...\n"
gem install rails -v 6.1
