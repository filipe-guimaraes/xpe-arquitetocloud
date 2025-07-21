variable "project_name" {
  type        = string
  description = "Nome do projeto base para os recursos"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block da VPC"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Lista de CIDRs para as subnets públicas"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Lista de CIDRs para as subnets privadas"
}

variable "aws_region" {
  type        = string
  description = "Região AWS onde os recursos serão criados"
  default     = "us-east-1"
}

variable "azs" {
  type        = list(string)
  description = "Lista de zonas de disponibilidade"
  default = [ "us-east-1a", "us-east-1b" ]
}
