#!/bin/bash

# ADD old ubuntu repositories
sudo touch /etc/apt/sources.list.d/oldrepo.list \
  && echo deb http://mirrors.kernel.org/ubuntu trusty main > /etc/apt/sources.list.d/oldrepo.list

#Install python 2
sudo apt-get update && sudo apt-get install -y python2.7 && sudo ln -s /usr/bin/python2.7 /usr/bin/python

#Install tools
sudo apt-cache showpkg libgtop2-7 \
        && sudo apt-get install -y python-gtk2 \
        && sudo apt-get install -y libgtop2-7 \
        && sudo apt-get install -y libgtop2-dev \
        && sudo apt-get install -y curl


#Install python-gtop
curl http://launchpadlibrarian.net/92221678/python-gtop_2.32.0+dfsg-1_amd64.deb  --output /tmp/gtop.deb
sudo dpkg -i /tmp/gtop.deb

#Install JAVA 11
sudo apt update
sudo apt install -y openjdk-11-jdk openjdk-11-jre

#Install GRAALVM
sudo curl -L https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-21.1.0/graalvm-ce-java11-linux-amd64-21.1.0.tar.gz --output /usr/lib/jvm/install.tar.gz
sudo tar -xzf /usr/lib/jvm/install.tar.gz
sudo rm /usr/lib/jvm/install.tar.gz

#Inside user and root ~/.bashrc add at the end
#export PATH=/usr/lib/jvm/graalvm-ce-java11-21.1.0/bin:$PATH
#export GRAALVM_HOME=/usr/lib/jvm/graalvm-ce-java11-21.1.0

#And then
source ~/.bashrc

#Install native-image graalvm plugin
gu install native-image
sudo apt-get install build-essential libz-dev zlib1g-dev



