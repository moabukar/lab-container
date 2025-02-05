# COntainer Toolbox 🛠️

A lightweight container optimized for DevOps labs. Includes essential CLI tools like Terraform, Vault, AWS CLI, Kubernetes tools, Helm, Kind, and more.

## Building

```bash
# Build the image
docker build -t moabukar/coderco-toolbox .

# Tag for versioning
docker tag moabukar/coderco-toolbox moabukar/coderco-toolbox:v1.0.0

# Push to Docker Hub
docker push moabukar/coderco-toolbox:v1.0.0
docker push moabukar/coderco-toolbox:latest

```

## Usage

```bash
docker run --rm -it moabukar/coderco-toolbox zsh


kubectl run toolbox --image=moabukar/coderco-toolbox:latest -- sleep infinity
kubectl exec -it toolbox -- zsh

# Inside the container:
terraform --version
vault --version
aws --version
kubectl version --client
helm version
```
