# Kubernetes
* https://kubernetes.io/docs/reference/kubectl/cheatsheet/

## Useful Commands
```
kubectl cluster-info # optional add "dump"
kubectl get nodes

kubectl run http-server-container --image=katacoda/docker-http-server --port=80 # deploys container
kubectl get pods | grep name-of-container

kubectl expose deployment http-server-container --port=80 --type=NodePort

# Find Port and send container cuirl request
export PORT=$(kubectl get svc http-server-container -o go-template='{{range.spec.ports}}{{if .nodePort}}{{.nodePort}}{{"\n"}}{{end}}{{end}}')
echo "Accessing host01:$PORT"
curl host01:$PORT
```

## References
* https://kubernetes.io
* https://www.katacoda.com/courses/kubernetes
