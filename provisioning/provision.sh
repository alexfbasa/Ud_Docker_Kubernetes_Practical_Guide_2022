#!/bin/bash

# Step 1: Edit /etc/hosts
cat <<EOF | sudo tee -a /etc/hosts
100.0.0.1 master.lab.com master
100.0.0.2 worker.lab.com worker
EOF

# Step 2: Update packages
sudo apt-get update

# Step 3: Install Docker
sudo apt install docker.io -y

# Step 4: Enable and start Docker service
sudo systemctl enable docker
sudo systemctl start docker

# Step 5: Check Docker status
sudo systemctl status docker

# Step 6: Disable UFW
sudo ufw disable

# Step 7: Disable swap
sudo swapoff -a

# Step 8: Update packages and install dependencies
sudo apt-get update && sudo apt-get install -y apt-transport-https

# Step 9: Add Kubernetes repository key
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

# Step 10: Add Kubernetes repository
sudo bash -c 'echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list'

# Step 11: Install Kubernetes components
sudo apt-get update && sudo apt-get install -y kubelet kubeadm kubectl

# Step 12: Enable and start kubelet service
sudo systemctl enable kubelet
sudo systemctl start kubelet

##!/bin/bash
#
## Update the list of packages
#sudo apt-get update
#
## Enable required kernel modules
#sudo modprobe overlay
#sudo modprobe br_netfilter
#echo "br_netfilter" | sudo tee -a /etc/modules
#
## Configure sysctl settings for Kubernetes
#cat <<EOF | sudo tee /etc/sysctl.conf
#net.bridge.bridge-nf-call-ip6tables = 1
#net.bridge.bridge-nf-call-iptables = 1
#net.ipv4.ip_forward = 1
#EOF
#sudo sysctl -p
#
## Disable swap
#sudo swapoff -a
#sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
#
## Disable UFW
#sudo ufw disable
#
## Install necessary packages
#sudo apt-get install -y apt-transport-https ca-certificates curl wget gnupg-agent software-properties-common
#
## Add Kubernetes repository
#curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
#echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
#
## Install Docker
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#sudo apt-get update
#sudo apt-get install -y docker-ce docker-ce-cli containerd.io
#sudo usermod -aG docker vagrant
#sudo rm /etc/containerd/config.toml
#sudo systemctl restart containerd
#
#sudo mkdir -p /etc/docker
#cat <<EOF | sudo tee /etc/docker/daemon.json
#{
#  "exec-opts": ["native.cgroupdriver=systemd"],
#  "log-driver": "json-file",
#  "log-opts": {
#    "max-size": "100m"
#  },
#  "storage-driver": "overlay2"
#}
#EOF
#sudo systemctl enable docker
#sudo systemctl daemon-reload
#sudo systemctl restart docker
#
#sudo rm /etc/containerd/config.toml
#
## Install Kubernetes components
#sudo apt-get install -y kubelet kubeadm kubectl kubernetes-cni
#sudo apt-mark hold kubelet kubeadm kubectl
#
## Note: Skip restarting Docker and containerd on worker nodes

