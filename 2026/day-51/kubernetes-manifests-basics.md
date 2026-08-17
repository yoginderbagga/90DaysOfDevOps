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
yoginderbagga@fedora:~$ cat busybox-pod.yml 
#Goal : Build a BusyBox Pod 
apiVersion: v1
kind: Pod
metadata:
  name: busybox-pod
  labels: 
    app: busybox
    environment: dev
spec:
  containers:
    - name: busybox
      image: busybox:latest
#      command: ["sh", "-c", "echo Hello from BusyBox && sleep 3600"]

yoginderbagga@fedora:~$ 

```
<img width="1436" height="255" alt="image" src="https://github.com/user-attachments/assets/536a8013-d4ea-4dab-b405-b526c773ff01" />

As you can see, the pod went into CrashLoopBackOff status as we removed the command field and Kubernetes defaults back to whatever is in the container image's Dockerfile. If you keep the ``command: sh...`` then it has the shell to be executed as default command, and not a long running background service which is any database or nginx server

## Task 3: Difference Between Imperative and Declarative Kubernetes Pods Making

In previous tasks, you tried the declarative method to build the pods in Kubernetes, lets try the imperative commands : 

``kubect  run redis-pod --image:redis:latest``

``kubectl get pods``

<img width="1532" height="347" alt="image" src="https://github.com/user-attachments/assets/e0994cf3-988f-40f0-8bf5-4958970d29b2" />

``yoginderbagga@fedora:~$ kubectl get pod redis-pod -o yaml``

Its evident that manually writing the manifest file doesn't add extra metadata info to the pods as much as it does int YAML we generate imperative method. 

## Task 4: Validate the Manifest File Before Applying it

```
yoginderbagga@fedora:~/kube-basics$ kubectl apply -f deployment.yml --dry-run=client
deployment.apps/my-first-app configured (dry run)
```

The above dry run worked as there was no error in the deployment.yml file. But if you see below i intentionally changed the image field to an invalid field and it immediately thrown an error message during the dry-run. 
```
yoginderbagga@fedora:~/kube-basics$ kubectl apply -f deployment.yml --dry-run=client
error: error parsing deployment.yml: error converting YAML to JSON: yaml: line 18: could not find expected ':'
```

## Task 5: Pod Labeling and Filtering

In Kubernetes you can use key-value pair attached to a objects like the pods to organize/group the selected resources. So the first few example of Kubernetes declarative we added the labels through YAML file itself. Now lets do it with the imperative approach : 

<img width="1717" height="285" alt="image" src="https://github.com/user-attachments/assets/e7a41910-ad06-4e23-b53d-e842efd2c036" />


```
yoginderbagga@fedora:~/kube-basics$ kubectl label pod my-first-app-599c5f5948-ckf68 environment=productionLevel
pod/my-first-app-599c5f5948-ckf68 labeled
```

## Task 6: Clean Up

Clean all the pods 

```
# Delete by the name of Pod
kubectl delete pod redis-pod
kubectl delete pod busybox-pod

# delete using the manifest file
kubectl delete -f deployment.yml
```

<img width="1802" height="187" alt="image" src="https://github.com/user-attachments/assets/3248a493-f83c-49b3-8b97-9a2c9362f905" />


## Observation / Learning

In this exercise you build pods using the imperative and declarative both the method. Learned about various fields in the manifest ``.YAML`` file fields like Kind, metadata, specs, apiVersion the starting field; these all properties are necessary to build a Kubernetes resource which can be a pod, service or deployment. 

You also build a custom pod ( BusyBox ) with the container image ``busybox:latest`` which basically run fine until you remove the image field with something else. Validating the manifest file is also important to see if there's any error message before you build the resource and you tried that in above excersise to see if any error occured. 

Label the pods to organize them into a group, this is done in both declarative and imperative method. Verified the pod label with the ``kubectl get pods --show-labels`` command. Eventually proceed with cleaning up the resources with both by directly deleting the pod or with the manifest file ``nginx-pod.yml`` file. 
