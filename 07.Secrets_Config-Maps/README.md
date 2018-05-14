# Kubernetes Manifests for Secrets and Config-Maps

These are examples for using Secrets and Config-Maps in K8s.

### 01. Manifests for Creating ConfigMap

Files 01.config-map-nginx-config.conf contains the nginx SSL configuration that we will mount in nginx container at **/etc/nginx/conf.d**

Command used to create the 03.create-configmap.yaml, Config-Map is :

`kubectl create configmap cmap --from-file=01.config-map-nginx-config.conf --from-file=02.config-map-sleep-interval -o yaml --dry-run > 03.creeate-configmap.yaml`

### 02. Manifests for Creating Secret

We created first self-signed-certificates using script **04.create-self-signed-certs.sh**

Command used to create **09.create-secret.yaml**, Secret is :

`kubectl create secret generic sec-ret --from-file=05.https.key --from-file=06.https.cert --from-file=07.bar -o yaml --dry-run > 09.create-secret.yaml`

### 03. Manifests for using Secrets and Config-Maps as Volumes in a Pod.

We created a simple nginx container and mounted the Config-Maps and Secrets in it.

To create the kubernetes resources, run the command

`kubectl create -f .`

To check the service running on both http and https port, run the command.

`minikube service secret-cmap-svc`

Change protocol to HTTPS from HTTP for one service tab in browser.

### 04. Manifests to create Image-Pull-Secret for Private-Docker-Registeries.

Run the below command to create Private-Docker-Registery secret.

`kubectl create secret docker-registry dhub-secret --docker-username=username --docker-password=password --docker-email=username@coolmail.com -o yaml --dry-run > 11.create-docker-image-pull-secret.yaml`

### 05. Manifests to create Image-Pull-Secret Pod.

You need to create a Private Repo in docker-Hub and push one image to private repo.

I pushed searx image to my private repo. Searx is Meta-Search-Engine.

To create the kubernetes resources, run the command

`kubectl create -f .`
