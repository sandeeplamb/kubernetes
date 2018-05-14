# Kubernetes Manifests for Secrets and Config-Maps

These are examples for using Secrets and Config-Maps in K8s.

### 01. Manifests for Creating ConfigMap

Command used is

`kubectl create configmap cmap --from-file=01.config-map-nginx-config.conf --from-file=02.config-map-sleep-interval -o yaml --dry-run > 03.creeate-configmap.yaml`

### 02. Manifests for using GITLAB Volume

### 03. Manifests for using GIT-SYNC SIDECAR container to update the Repository

### 04. Manifests for Persistent-Volume(PV) and Persistent-Volume-Claim(PVC) 
