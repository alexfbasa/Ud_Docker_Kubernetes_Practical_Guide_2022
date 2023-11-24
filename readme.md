# Kubernetes Lab Readme

## Overview

Kubernetes is a powerful container orchestration platform that automates the deployment, scaling, and management of
containerized applications. This lab provides a hands-on experience with Kubernetes, focusing on understanding its core
functions, the roles of master and node components, and utilizing Minikube for local development.

## Kubernetes Components

### Master Components

The Kubernetes master is responsible for managing the overall state of the cluster and making global decisions. It
consists of the following components:

1. **API Server:** The central management entity that receives RESTful API requests for managing cluster resources.

2. **Controller Manager:** Enforces cluster policies, monitors and responds to cluster events.

3. **Scheduler:** Assigns nodes to newly created pods based on resource requirements and other constraints.

4. **etcd:** A distributed key-value store that stores the configuration data of the cluster.

### Node Components

Nodes are the worker machines in a Kubernetes cluster, responsible for running containers. Node components include:

1. **Kubelet:** Ensures that containers are running in a Pod.

2. **Kube Proxy:** Maintains network rules on nodes, allowing communication between Pods and external traffic.

3. **Container Runtime:** Software responsible for running containers (e.g., Docker, containerd).

## Setup

This lab utilizes Vagrant to provision two nodes, a Master and Worker.
Most of the needed tools will be installed in both hosts by running Vagrant.

```commandline
cd provisioning
vagrant up
```

run the kubernetes initialization command on only on MASTER node:

```commandline
sudo kubeadm init --apiserver-advertise-address=100.0.0.1 --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config


```


Note down kubeadm join command which we are going to use from worker node to join the master node using token. (Note : -
Following command will be different for you, do not try copy the following command)

*Do not execute the referred command in the worker node yet.*

```commandline
kubeadm join 100.0.0.1:6443 --token {{YOUR_TOKEN}} --discovery-token-ca-cert-hash sha256:{{YOUR_HASH}}
```

After the master of the cluster is ready to handle jobs and the services are running, for the purpose of making
containers accessible to each other through networking, we need to set up the network for container communication.

Copy from [`/provisioning/files/kube-flannel.yml`](./provisioning/files/kube-flannel.yml) into Master node and apply it.
You can run it by vagrant scp using vagrant-scp plugin:

```commandline
vagrant plugin install vagrant-scp
vagrant scp files/kube-flannel.yml master:/tmp
vagrant ssh master
cd /tmp
kubectl apply -f kube-flannel.yml
```

Now you can execute the kubeadm join in the worker node:
```commandline
sudo kubeadm join 100.0.0.1:6443 --token {{YOUR_TOKEN}} --discovery-token-ca-cert-hash sha256:{{YOUR_HASH}}
```

## Lab Instructions

1. **Clone the Repository:**

```bash
git clone <repository-url>
cd <repository-directory>
```

## Additional Resources

- [Kubernetes Documentation](https://kubernetes.io/docs/)




