# Kubernetes Manifest File and Running Pods

A deployment file is a text based ``.yml`` file used to create the pods or container in your existing ``cluster`` which can be from minikube, KIND or cloud provider like EKS, GKS, AKS tool for creating the cluster first before deploying any Kubernetes pods. 

The first step is always to ensure that cluster is running in our case, we are using ``minikube`` which is tool to locally run the Kubernetes cluster. 

<img width="1916" height="925" alt="image" src="https://github.com/user-attachments/assets/de5aa10c-4308-404e-bcb6-0acc66cb786a" />


## Task 1:

Kubernete resource are written using the ``YAML`` format which consist of four most common require fields : 

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-first-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: webserver
  template:
    metadata:
      labels:
        app: webserver
    spec:
      containers:
      - name: nginx-container
        image: nginx:stable-alpine
        ports:
        - containerPort: 80

```

Lets understand the above four fields which are common in the Kubernetes manifest file:

1. **apiVersion**: which API group to use. For Pods it is ``v1``
2. **kind**: the type of the resource which is ``Deployment`` in above file; and it tells that you want to manager the containers declaratively and automatically. Means if something crashes it will keep on running.( Automatic self-healing ) 
3. **metadata**: it is an information that uniquely identifies like names, labels of the Kubernetes objects.
4. **spec**: The desired state or specification as it says. For pods perspective, this means which containers to run and which images and port number to be used. In the above example, we had used ``nginx:stable-alpine`` docker image for this pod creation and you can use any of the container image based on the pods you're building. 

## To Build Your First Node - run below command

``yoginderbagga@fedora:~/kube-basics$ kubectl apply -f deployment.yml``

To check the status of the pods that are running use below commands:

```
kubectl get pods
kubectl get pods -o wide

To get detail info about the pods :

kubectl describe pod my-first-app-58b676b65b-dgjq6

To read the logs :
kubectl logs my-first-app-58b676b65b-dgjq6 

To get a shell access inside the container:

 kubectl exec -it my-first-app-58b676b65b-dgjq6 --  /bin/bash

```
Below is the output of above Pod that runs a nginx server : 

<img width="1912" height="397" alt="image" src="https://github.com/user-attachments/assets/2981b848-8ae5-48dc-b857-ac3bb49d4c8a" />

Now to scale down to 0 pods as you no longer need it for the testing. Run below command and verify :

```
yoginderbagga@fedora:~/kube-basics$ kubectl scale deployment my-first-app --replicas=0
deployment.apps/my-first-app scaled
yoginderbagga@fedora:~/kube-basics$ kubectl get pods
NAME                                   READY   STATUS    RESTARTS      AGE
kubernetes-bootcamp-67fbdd6b79-68ppx   1/1     Running   1 (35m ago)   2d
kubernetes-bootcamp-67fbdd6b79-pwx9d   1/1     Running   1 (35m ago)   47h
```

Example #2 - Created another pod ``redis_pod.yml`` with Kubernetes Manifest file,  it uses the same fields like ``apiVersion``, ``kind`` and ``metadata`` which is again mandatory field to uniquely identify pod, and organize it. There is a field call ``spec`` which as the name implies is used to add specification like container name, image and ports. 
The kind field in the starting is used to define the kind of resource or object you're building such as : ``pod`` , ``Deployment``, ``Service``, ``ConfigMap`` and ``Secret``

<img width="1916" height="737" alt="image" src="https://github.com/user-attachments/assets/d6639045-120a-4b23-a791-c4ac4b27784b" />


## Task 2: Build a Custom Pod BusyBox

Create a new manifest name ``busybox-pod.yml`` from the start. 

```
apiVersion: v1
```

## Task 3: Difference Between Imperative and Declarative Kubernetes Pods Making

