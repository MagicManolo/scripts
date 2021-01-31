#!/bin/bash

# Update of System packages
sudo apt update && upgrade

# Install Additional packages needed for interaction
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# if present, remove old versions of container runtime on the host
sudo apt-get remove docker docker-engine docker.io containerd runc

# Add docker's GPG-Key to the package manager
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add the docker repository to the host
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the package manager for the docker repository   
sudo apt-get update
   
# install the docker engine   
sudo apt-get install docker-ce docker-ce-cli containerd.io

# install docker-compose from official github-repository, make it executable, move to ENV-Path
curl https://github.com/docker/compose/releases/download/1.28.2/docker-compose-Linux-x86_64 \
  -o $PWD/docker-compose && \
  chmod +x $PWD/docker-compose && \
  mv $PWD/docker-compose /usr/local/bin

# make docker accessible for the current non root user, withour sudo
sudo usermod -aG docker $USER

EOF
