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
