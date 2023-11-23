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

## Minikube Setup

This lab utilizes Minikube, a tool to run Kubernetes clusters locally. Follow the instructions
in [`install_kubernetes.txt`](./install_kubernetes.txt) in the same directory to install Minikube before proceeding.

## Lab Instructions

1. **Clone the Repository:**
```bash
git clone <repository-url>
cd <repository-directory>
```

2. **Install Minikube:**
Follow the instructions in `install_kubernetes.txt` to install Minikube on your machine.

3. **Start Minikube Cluster:**
```bash
minikube start
```

4. **Explore Kubernetes:**
 - Deploy sample applications.
 - Inspect pods, services, and other resources.
 - Scale deployments and observe the behavior.

5. **Clean Up:**
```bash
minikube stop
```

## Additional Resources

- [Kubernetes Documentation](https://kubernetes.io/docs/)
- [Minikube Documentation](https://minikube.sigs.k8s.io/docs/)

Happy Kubernetes Learning!



