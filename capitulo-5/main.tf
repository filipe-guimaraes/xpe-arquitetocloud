module "aws_infrastructure" {
  source                   = "./modules/aws"
  vpc_name                 = "xpe-vpc"
  ami_id                   = "ami-053b0d53c279acc90" # Ubuntu Server 22.04 LTS - us-east-1
  instance_type            = "t3a.small"
  key_name                 = "webserver"
  azurewebserver_public_ip = module.azure_infrastructure.public_ip
}

module "azure_infrastructure" {
  source    = "./modules/azure"
  vnet_name = "xpe-vnet"
  location  = "eastus"
  vm_size   = "Standard_B1ms"
}