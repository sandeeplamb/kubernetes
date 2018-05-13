# Kubernetes Manifests for Volumes

These are examples for basic Volumes types that can be used in K8s.

### 01. Manifests for EmptyDir Volume
Creates a volume **html** and mounts in nginx and html-generator containers of the Pod.

Container html-generator, mounts the **html** Volume at **/var/htdocs** and it runs the command **fortune** and updates the content in file **index.html**. Command **fortune** runs every 10 seconds, so the contents of index.html changes as well.

Container nginx, mounts **html** Volume at **/usr/share/nginx/html** and runs nginx process.

Simple NodePort service **volume-empty** will expose the endpoints.

Run command **minikube service volume-empty** to see the contents of **index.html**

### 02. Manifests for using GITLAB Volume
Creates a GITLAB Volume to clone the gitlab repo in the nginx container.

This will not sync the container repo, in case you will update the repo after creating the Deployment.

You need to kill the pod, in order to sync with your repo again.

### 03. Manifests for using GIT-SYNC SIDECAR container to update the Repository
This works same like before, but git-sync sidecar container will sync the repo without killing the Pod as in case 2.

Run command **minikube service volume-git-sync** to see the contents of your repo.

### 04. Manifests for Persistent-Volume(PV) and Persistent-Volume-Claim(PVC) 
This manifests shows how to create Persistent-Volume from minikube as a hostPath Volume and then create the Persistent-Volume-Claim from Persistent-Volume.

You can mount Persistent-Volume-Claim in any Pod.

It is 3 step Process.
1. Create Persistent-Volume - PV.
1. Create Persistent-Volume-Claim - PVC.
1. Mount PVC in Pod.
