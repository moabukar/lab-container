# DevOps Toolbox 🛠️

A lightweight container optimized for DevOps labs. Includes essential CLI tools like Terraform, Vault, AWS CLI, Kubernetes tools, Helm, Kind, and more.

## Building

```bash
# Build the image
docker build -t moabukar/devops-toolbox .

# Tag for versioning
docker tag moabukar/devops-toolbox moabukar/devops-toolbox:v1.0.0

# Push to Docker Hub
docker push moabukar/devops-toolbox:v1.0.0
docker push moabukar/devops-toolbox:latest

```

## Usage

```bash
docker run --rm -it moabukar/devops-toolbox zsh


kubectl run toolbox --image=moabukar/devops-toolbox:latest -- sleep infinity
kubectl exec -it toolbox -- zsh

# Inside the container:
terraform --version
vault --version
aws --version
kubectl version --client
helm version
```
