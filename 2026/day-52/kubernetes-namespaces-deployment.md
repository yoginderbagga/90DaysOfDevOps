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


<img width="1281" height="427" alt="image" src="https://github.com/user-attachments/assets/5806ab3e-6501-4cc7-bd6f-54d2cb196f88" />

### Task 3: Create the Deployment 

Before creating a Deployment, lets understand what is Deployment? 

A deployment is like a blueprint ( YAML instruction file) which gives the target number of replicas to be run. Now suppose, the "Deployment" in Kubernetes as a Super Robot Manager for your applications and you're running a "ThinkMyWeb" and the code runs inside a virtual container called Pod. 

1. Suppose if there's only one pod running this can be destructive for the business as one pod may crash and website will be down for a period of time.
2. Second, if there are thousands of users visiting the website, "ThinkMyWeb" again overloads or gets hanged in between. You go manually launch the pod and monitor the pods yourself, how about hire a Deployment to do this for you.

What will the Deployment blueprint file do in this case?

-- First, it define the exact instruction like _I want to use nginx:1.24 blueprint_
-- Second, it says exactly 3 identical clones or the ``replicas:3`` of the app running all times. 

Create a file ``nginx-deployment.yml``

```
apiVersion: apps/v1
```
<img width="1362" height="102" alt="image" src="https://github.com/user-attachments/assets/2de6d359-ac4a-48a1-9c35-0a7002ed5451" />


<img width="1267" height="202" alt="image" src="https://github.com/user-attachments/assets/6663affd-da58-44f8-a053-2c7af9c0ba80" />

### Task 4: Self-Healing in Kubernetes -- Delete a Pod and See if It Come Back

A standard pod doesn't come back up once its deleted, whereas Deployment Pod does come up, as you can see we deleted ``nginx-deployment-5d9c84579f-4jcdv`` pod and then immediately after it recreated a new pod with a different name ``nginx-deployment-5d9c84579f-4v4mc``

<img width="1445" height="467" alt="image" src="https://github.com/user-attachments/assets/bde792ad-260b-4eb6-988f-ef96054464f3" />


### Task 5: Scale the Deployment

As you can see we have changed the number of the replicas for the deployment ``nginx-deployment`` to 5 from 3. And then in the next command we scaled it down to number 2. 

<img width="1456" height="332" alt="image" src="https://github.com/user-attachments/assets/cf0b8f68-0ce6-4d77-a7d6-a5e8ccb84fad" />

<img width="1347" height="250" alt="image" src="https://github.com/user-attachments/assets/8bbb523a-e3c5-41e8-9e02-dddbc127c7e0" />

**Verify** : Can confirm that Kubernetes Pod scaled down from 5 to 2. 

### Task 6: Rolling Update

What is rolling update in Kubernetes?

A Kubernetes rolling update is the default deployment strategy that ``replaces old Pods with new ones incrementally to ensure zero downtime.`` Instead of taking down the entire application, Kubernetes updates a few Pods at a time, keeping the application available to handle traffic throughout the process.

``

<img width="1767" height="372" alt="image" src="https://github.com/user-attachments/assets/eec5b53d-5de9-4070-88d7-6888b025ecbf" />

<img width="1762" height="195" alt="image" src="https://github.com/user-attachments/assets/5c3f7a83-e32f-4caf-8246-a64480741127" />
