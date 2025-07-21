module "network" {
  source               = "./modules/network"
  project_name         = var.project_name
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs
}

module "compute" {
  source             = "./modules/compute"
  project_name       = var.project_name
  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  depends_on = [ module.network ]
}

module "loadbalancer" {
  source            = "./modules/loadbalancer"
  project_name      = var.project_name
  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  instance_ids      = module.compute.instance_ids
  security_group_id = module.compute.security_group_id
  depends_on = [ module.network, module.compute ]
}
