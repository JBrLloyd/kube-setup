# Start minikube using docker
minikube start --driver=docker --memory 2G

# Create a k8s namespace for ArgoCD
argo_namespace="argocd"
kubectl create ns $argo_namespace
kubectl config set-context --current --namespace=$argo_namespace

# Create ArgoCD k8s resources in the namespace
kubectl apply -n $argo_namespace \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
# You can delete argo resources with: kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# List out newly created ArgoCD k8s resources
kubectl get all -n $argo_namespace

# Print ArgoCD UI admin's password
kubectl -n $argo_namespace get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo

kubectrl apply -n $argo_namespace -f ../configure-repo.yaml

# Port forward ArgoCD HTTP UI's port onto local machine's 8030 port
# Access via the browser using the above password with 'admin' username
kubectl port-forward svc/argocd-server -n $argo_namespace 8030:443