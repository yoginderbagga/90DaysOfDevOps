# Kubernetes Architecture and Cluster

In today's task, you will learn about Kubernetes architecture, install a local cluster on your virtual machine/cloud and run the ``kubectl`` to manage the Kubernetes. So far you have already build Docker containers and pushed them to the Docker hub but what if there are hundreds or even thousands of containers to be manage? How do you handle such situation. We will look into that in today's session. 

## Task 1: Kubernetes Need

1. What is the need of Kubernetes? What problem does Kubernetes solve that can not be solved with Docker.
2. Who build the Kubernetes platform and what was the reason to build it


## Task 2: Draw the Kubernetes Architecture 

### Control Plane (Master Node):

- API Server:
- etcd:
- Scheduler:
- Controller Manager

### Worker Node: 

- Kubelet
- kube-proxy
- Container Runtime

## Task 3: Setting up Kubectl

``kubectl`` is the CLI tool for managing the Kubernetes cluster. 


## Task 4: Setting up the Local Cluster 

Use any one``minikube`` OR ``kind (Kubernetes in Docker)`` to setup the Kubernetes on your laptop/cloud.



## Task 5: Explore Kubernetes Basic commands

```
kubectl cluster-info

kubectl get nodes

kubectl describe node <node-name>

kubectl get namespace

kubectl get pods -A
```


## Task 6: The Lifecycle of a Cluster 

```
kind delete cluster --name xyz

kind create cluster --name xyz

kubectl get nodes
```
