#!/bin/bash
set -e  # Exit on error

INSTALL_DIR="/build/bin"
TMP_DIR="/tmp"

mkdir -p $INSTALL_DIR

# Terraform
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O $TMP_DIR/terraform.zip
unzip $TMP_DIR/terraform.zip -d $INSTALL_DIR
chmod +x $INSTALL_DIR/terraform
rm -rf $TMP_DIR/terraform.zip

# Vault
wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip -O $TMP_DIR/vault.zip
unzip $TMP_DIR/vault.zip -d $INSTALL_DIR
chmod +x $INSTALL_DIR/vault
rm -rf $TMP_DIR/vault.zip

# Helm
wget https://get.helm.sh/helm-v${HELM_VERSION}-linux-amd64.tar.gz -O $TMP_DIR/helm.tar.gz
tar -xf $TMP_DIR/helm.tar.gz -C $TMP_DIR
mv $TMP_DIR/linux-amd64/helm $INSTALL_DIR/helm
chmod +x $INSTALL_DIR/helm
rm -rf $TMP_DIR/helm.tar.gz $TMP_DIR/linux-amd64

# kubectl
wget https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -O $INSTALL_DIR/kubectl
chmod +x $INSTALL_DIR/kubectl

# kind
wget https://github.com/kubernetes-sigs/kind/releases/download/${KIND_VERSION}/kind-linux-amd64 -O $INSTALL_DIR/kind
chmod +x $INSTALL_DIR/kind

# Traefik
wget https://github.com/traefik/traefik/releases/download/v${TRAEFIK_VERSION}/traefik_v${TRAEFIK_VERSION}_linux_amd64.tar.gz -O $TMP_DIR/traefik.tar.gz
tar -xf $TMP_DIR/traefik.tar.gz -C $TMP_DIR
mv $TMP_DIR/traefik $INSTALL_DIR/traefik
chmod +x $INSTALL_DIR/traefik
rm -rf $TMP_DIR/traefik.tar.gz

# Task
wget https://github.com/go-task/task/releases/download/v${TASK_VERSION}/task_linux_amd64.tar.gz -O $TMP_DIR/task.tar.gz
tar -xf $TMP_DIR/task.tar.gz -C $INSTALL_DIR
chmod +x $INSTALL_DIR/task
rm $TMP_DIR/task.tar.gz

# kubectx / kubens
wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubectx -O $INSTALL_DIR/kubectx
wget https://raw.githubusercontent.com/ahmetb/kubectx/master/kubens -O $INSTALL_DIR/kubens
chmod +x $INSTALL_DIR/kubectx $INSTALL_DIR/kubens

echo "✅ All binaries installed successfully!"
