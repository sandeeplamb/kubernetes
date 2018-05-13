# Kubernetes Manifests for Volumes

These are examples for basic Volumes types that can be used in K8s.

### 01. Manifests for EmptyDir Volume
Creates a volume *html* and mounts in nginx and html-generator containers of the Pod.

Container html-generator, mounts the *html* Volume at */var/htdocs* and it runs the command *fortune* and updates the content in file *index.html*. Command *fortune* runs every 10 seconds, so the contents of index.html changes as well.

Container nginx, mounts *html* Volume at */usr/share/nginx/html* and runs nginx process.

Simple NodePort service *volume-empty* will expose the endpoints.

Run command *minikube service volume-empty* to see the contents of *index.html*

### 02. Manifests for using GITLAB Volume

### 03. Manifests for using GIT-SYNC SIDECAR container to update the Repository

### 04. Manifests for Persistent-Volume(PV) and Persistent-Volume-Claim(PVC) 
