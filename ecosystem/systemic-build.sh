

# Terraform installation https://www.terraform.io/intro/getting-started/install.html
curl -O https://releases.hashicorp.com/terraform/0.7.6/terraform_0.7.6_linux_amd64.zip

mkdir terraform
ls

mv terraform_0.7.6_linux_amd64.zip terraform/terraform_0.7.6_linux_amd64.zip
cd terraform

ls

tar -zxvf terraform_0.7.6_linux_amd64.zip

# Packer installation https://www.packer.io/docs/installation.html
curl -O https://releases.hashicorp.com/packer/0.10.2/packer_0.10.2_linux_amd64.zip

tar -zxvf packer_0.10.2_linux_amd64.zip
