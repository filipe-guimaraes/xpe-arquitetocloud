module "vpc_01" {
  source = "./modules/vpc"
  vpc_name = "vpc-01"
}

module "vpc_02" {
  source = "./modules/vpc"
  vpc_name = "vpc-02"
  vpc_cidr_block = "10.10.0.0/16"
  public_subnets_cidr_blocks = ["10.10.0.0/24", "10.10.2.0/24", "10.10.4.0/24"]
  private_subnets_cidr_blocks = ["10.10.1.0/24", "10.10.3.0/24", "10.10.5.0/24"]
  availability_zones         = ["us-east-1a", "us-east-1b", "us-east-1c"]
}