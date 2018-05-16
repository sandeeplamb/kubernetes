# Kubernetes Manifests for Downward-API

These are examples for using Downward-API as environment variables or as Files to access Pod data.

### 01. Manifests for accessing Pod data as environment variables

`kubectl create -f 01.downwardAPI_env.yaml`

### 02. Manifests for accessing Pod data as files after mounting downwardAPI volume.

`kubectl create -f 03.downwardAPI_volume.yaml`

### 03. Manifests for accessing API-Server api's using curl command.

We will create a Pod with one container. After creating Pod, we will create 2 environment variable in the container to access the API-Server from container using curl.

Create the Pod.

`kubectl create -f 03.api-server.yaml`

There are 3 steps in accessing the API-Server on Master Node.

1. Find Location of API-Server.
1. Verifying the API-Server Identity.
1. Authenticating with API-Server.

#### 01.Find Location of API-Server

This can be find out using container Environmental variables.

`root@curl:/# env | grep KUBERNETES_SERVICES`

#### 02. Verifying the API-Server Identity

Default Secret Volumes mounted at **/var/run/secrets/kubernetes.io/serviceaccount/** contains the **cacert** which was used to sign the API-Server's certificate.

We can send the command like

`root@curl:/# curl --cacert=/var/run/secrets/kubernetes.io/serviceaccount/cacert https://kubernetes`

Or use the environment variable **CURL_CA_BUNDLE**

`root@curl:/# export CURL_CA_BUNDLE=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt`

and send just

`root@curl:/# curl https://kubernetes`

#### 03. Authenticating with API-Server

We should make TOKEN an environment vairables and sent request to API-Server using curl.

`root@curl:/# export TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)`

`root@curl:/# curl -H "Authorization: Bearer $TOKEN" https://kubernetes`

### 04. Manifests to access API-Server using ambassador container without worrying about above steps.

We will use another SideCar Container i.e. Ambassador Container in the same Pod who will do the heavy lifting of API-Server identification and authorization.

`kubectl create -f 04.api-server-with-ambassador.yaml`

`kubectl exec -it curl-api-server-ambassador /bin/bash`

`root@connect-api-server-ambassador:/# curl localhost:8001`
