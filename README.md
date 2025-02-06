# DevOps Toolbox 🛠️

A lightweight container optimised for DevOps labs. Includes essential CLI tools like Terraform, Vault, AWS CLI, Kubernetes tools, Helm, Kind, and more.

## Building

```bash
docker build -t moabukar/devops-toolbox .

docker tag moabukar/devops-toolbox moabukar/devops-toolbox:v1.0.0

docker push moabukar/devops-toolbox:latest

```

## Usage

```bash
docker run --rm -it moabukar/devops-toolbox:fbccea7 zsh

kubectl run toolbox --image=moabukar/devops-toolbox:fbccea7 -- sleep infinity
kubectl exec -it toolbox -- zsh

# Inside the container:
terraform --version
vault --version
aws --version
kubectl version --client
helm version
```
