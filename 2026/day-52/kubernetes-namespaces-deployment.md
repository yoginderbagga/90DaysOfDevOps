## Kubernetes Namespaces and Deployment


### Task 1: Explore the Default Namespace

``kubectl get namespace``

There are different namespaces exist in Kubernetes and below are the most common: 

- ``default`` : This is the default namespace where the resources are assigned if you don't give any specific namespace
- ``kube-system``: internal parts of the Kubernetes like API server, scheduler
- ``kube-public``: public accessible resources
- ``kube-node-lease`` : this holds the lease object associates with cluster object

Lets see what is running inside the ``kube-system`` 

``yoginderbagga@fedora:~$ kubectl  get pods -n kube-system``


<img width="1327" height="307" alt="image" src="https://github.com/user-attachments/assets/beccb185-f9aa-42c6-a532-583e08f46ab6" />

Most of the resources running inside this namespace are the internal components of the cluster which is alive. There are 10 pods currently running as per above output.
