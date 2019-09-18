#!/bin/bash
# Written by Justin Wilson, 2019

# Note: This script should be run as root (or using sudo)!
# The purpose of this script is to create a one-step process to install Bro (Zeek).
# Written for Debian based distros (uses 'apt')

# Install updates (recommended)
apt-get update -y
# apt-get upgrade -y

# Install Required Dependencies
sudo apt-get install cmake make gcc g++ flex git bison python-dev swig libpcap-dev libssl-dev zlib1g-dev libgeoip-dev -y

# Download & Install Bro-IDS
git clone --recursive https://github.com/zeek/zeek
cd zeek
./configure
make
make install

# modify PATH
export PATH=/usr/local/zeek/bin:$PATH

# add path to ~/.profile file in your home directory to make the change permanent.
echo "PATH=/usr/local/zeek/bin:$PATH" >> ~/.profile

# Provide the user withs some instructions
echo ''
echo 'Done! To configure:'
echo '1. In /usr/local/zeek/etc/node.cfg, set the right interface to monitor.'
echo '2. In /usr/local/zeek/etc/networks.cfg, comment out the default settings and add the networks that Bro will consider local to the monitored environment.'
echo '3. In /usr/local/zeek/etc/zeekctl.cfg, change the MailTo email address to a desired recipient and the LogRotationInterval to a desired log archival frequency.'
echo ''
echo 'Now start the ZeekControl shell like:'
echo 'zeekctl (may need full path: /usr/local/zeek/bin/zeekctl'
echo ''
echo 'Since this is the first-time use of the shell, perform an initial installation of the BroControl configuration:'
echo '[ZeekControl] > install'
echo ''
echo 'Then start up a Bro instance:'
echo '[ZeekControl] > start'
echo ''
echo 'For further instructions, visit https://docs.zeek.org/en/stable/quickstart/index.html'


