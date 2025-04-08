# Kube Setup

A sample Kubernetes setup for ArgoCD, stateful sets and more.

## Locally Setup

### Prerequisites

1. Docker installed, you can use another cluster runtime or virtual machine as your
  minikube driver, but note that podman is experimental.
1. Minikube installed: [Minikube | Install](https://minikube.sigs.k8s.io/docs/start)

### Running

1. Start Minikube - `minikube start --driver=docker --memory 2G`
2. Create a k8s namespace for ArgoCD - `kubectl create ns argocd`