## Kubernetes Namespaces and Deployment


### Task 1: Explore the Default Namespace

``kubectl get namespace``

There are different namespaces exist in Kubernetes and below are the most common: 

- ``default`` : This is the default namespace where the resources are assigned if you don't give any specific namespace
- ``kube-system``: internal parts of the Kubernetes like API server, scheduler
- ``kube-public``: public accessible resources
- ``kube-node-lease`` : this holds the lease object associates with cluster object
