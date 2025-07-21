#!/bin/bash

set -e

TERRAFORM_VERSION="1.10.5"
DOWNLOAD_URL="https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
ZIP_FILE="terraform_${TERRAFORM_VERSION}_linux_amd64.zip"

echo "📦 Removendo qualquer versão anterior do Terraform..."
sudo rm -f /usr/local/bin/terraform

echo "⬇️ Baixando Terraform v${TERRAFORM_VERSION}..."
wget -q "$DOWNLOAD_URL" -O "$ZIP_FILE"

echo "📂 Instalando unzip (se necessário)..."
sudo apt update -qq
sudo apt install -y unzip > /dev/null

echo "📦 Descompactando Terraform..."
unzip -o "$ZIP_FILE" > /dev/null

echo "🚚 Movendo binário para /usr/local/bin/..."
sudo mv terraform /usr/local/bin/

echo "🧹 Limpando arquivos temporários..."
rm -f "$ZIP_FILE"

echo "✅ Instalação concluída!"
terraform version