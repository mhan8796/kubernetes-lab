# Kubernetes Lab

A real local Kubernetes project with YAML manifests for pods that print
`hello world` to their logs.

## Files

```text
cluster/kind-cluster.yaml      local kind cluster definition
app/Dockerfile                 hello-world web container image
app/index.template.html        page served by each pod
app/start.sh                   starts logging and the web server
manifests/namespace.yaml       hello-world namespace
manifests/deployment.yaml      3 hello-printer pods
manifests/service.yaml         stable service for pod traffic
manifests/kustomization.yaml   apply everything together
```

## Create The Cluster

```bash
./bin/kind create cluster --config cluster/kind-cluster.yaml
```

## Deploy The Pods

```bash
docker build -t hello-kubernetes:0.1.0 app
./bin/kind load docker-image hello-kubernetes:0.1.0 --name hello-k8s
kubectl apply -k manifests
kubectl -n hello-world get pods
```

## Serve Traffic To Localhost

```bash
kubectl -n hello-world port-forward service/hello-service 8080:80
```

Then open:

```text
http://127.0.0.1:8080
```

## Watch Hello World Logs

```bash
kubectl -n hello-world logs -f deployment/hello-printer
```

## Scale The Pods

```bash
kubectl -n hello-world scale deployment/hello-printer --replicas=5
kubectl -n hello-world get pods
```

## Clean Up

```bash
kubectl delete -k manifests
./bin/kind delete cluster --name hello-k8s
```
