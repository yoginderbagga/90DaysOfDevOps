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

### Task 2: Creating and Using Custom Namespace


To create the namespace run below commands and verify the output of the same: 

```
yoginderbagga@fedora:~$ kubectl create namespace dev
namespace/dev created
yoginderbagga@fedora:~$ kubectl create namespace staging
namespace/staging created
```

<img width="1072" height="252" alt="image" src="https://github.com/user-attachments/assets/033d4060-0959-40f9-baf7-3cf2bbea92f7" />


Create namespace using .yml file declarative method and then apply it on a pod. 

```
yoginderbagga@fedora:~$ cat namespace.yml 
apiVersion: v1
kind: Namespace
metadata:
  name: production
```


Below command will create a namespace from a manifest file:
```
yoginderbagga@fedora:~$ kubectl apply -f namespace.yml 
namespace/production created
```

Finally, create a Kubernetes pod ``nginx-dev`` and ``nginx-staging`` and apply the namespace ``dev`` and ``staging`` which you created above. 
<img width="1177" height="117" alt="image" src="https://github.com/user-attachments/assets/cadfe1b6-5d85-453b-8bfc-31d0af635956" />
