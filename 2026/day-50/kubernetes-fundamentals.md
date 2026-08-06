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
