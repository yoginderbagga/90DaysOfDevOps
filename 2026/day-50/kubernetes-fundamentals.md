# Kubernetes Architecture and Cluster

In today's task, you will learn about Kubernetes architecture, install a local cluster on your virtual machine/cloud and run the ``kubectl`` to manage the Kubernetes. So far you have already build Docker containers and pushed them to the Docker hub but what if there are hundreds or even thousands of containers to be manage? How do you handle such situation. We will look into that in today's session. 

## Task 1: Kubernetes Need

1. What is the need of Kubernetes? What problem does Kubernetes solve that can not be solved with Docker.
2. Who build the Kubernetes platform and what was the reason to build it


Kubernetes is an open source system for automating the deployment, scaling and managing the containerized applications. As you know, container helps in bundle and running the application. In a production environment, when the number of containers grow it becomes difficult to manage them when the application is live and you need to ensure no downtime. For example, if container goes down, and immediately another container needs to start, doing this manually is not the right approach. How about having a system which can handle this automatically? So Kubernetes handle the scaling of the application containers, managing the failovers and much more. 

Kubernetes Features: 

1. **Self-Healing**: If the containers fails, Kubernetes restarts the container, replace the containers or kill the containers which doesn't response to the user requirement. 
2. DNS Service Expose and Load Balancing Management: With Kubernetes you can expose a container with its DNS name or its own IP address. Also, when the traffic to a container goes high, Kubernetes is able to load balance the network traffic so the deployment is stable.
3. **Storage Orchestration**: Automatically mount a storage on the basis of your choice like local, on premise, or cloud.



## Task 2: Draw the Kubernetes Architecture 

### Control Plane (Master Node):


Kubernetes control plane is combination of components (parts) which work together to manage the state of cluster.  It is the central governing layer which acts as the "brain" of a cluster. It makes the decision, schedule the workloads and detect the cluster events. For example : 

1. Bring a new Pods on the node
2. Automatically start a new container if any failure occur
3. To move the Pods to different Node when a Nodes become unavailable. 

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
