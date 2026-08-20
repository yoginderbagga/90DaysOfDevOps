
# Kubernetes Service

A service works like a stable network endpoint and routing rules to expose a group of pods on a Network. The pods are created, destroyed or rescheduled frequently so their IP address changes frequently. Now this problem can be solved with a permanent virtual IP address or a DNS Hostname which remains constant. 
Second, it also provide Load balancing across all the pods which matches its selector. 

## Why Kubernetes Services?

### Task 1: Deploy the Application

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web-app
  labels:
    app: web-app
spec:
  replicas: 3
  selector:
    matchLabels:
      app: web-app
  template:
    metadata:
      labels:
        app: web-app
    spec:
      containers:
      - name: nginx
        image: nginx:1.25
        ports:
        - containerPort: 80
```

<img width="1711" height="147" alt="image" src="https://github.com/user-attachments/assets/88b67f9c-3047-40a4-b49a-1d0e8b2c3927" />

```
yoginderbagga@fedora:~$ kubectl rollout restart deployment/web-app
deployment.apps/web-app restarted
```
Restarted the pods using the above command and can be seen that IP address were changed for all three pods. Now this issue gets resolved with the ``Service`` type in next task.
<img width="1746" height="180" alt="image" src="https://github.com/user-attachments/assets/e3ff4618-2093-479f-aadf-a694899bb150" />

## Task 2: ClusterIP Service
