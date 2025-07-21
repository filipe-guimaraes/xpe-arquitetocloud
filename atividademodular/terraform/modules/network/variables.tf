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

variable "azs" {
  type        = list(string)
  description = "Lista de zonas de disponibilidade"
}
