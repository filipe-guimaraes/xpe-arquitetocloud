variable "vpc_name" {
  type        = string
  description = "Nome da VPC"
  default     = "my-vpc"
}

variable "aws_region" {
  type        = string
  description = "Região da AWS utilizada no projeto"
  default     = "us-east-1"
}

variable "vpc_cidr_block" {
  type        = string
  description = "Bloco CIDR de endereço IPv4 usado nesssa VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidr_blocks" {
  type        = list(string)
  description = "Mapa de blocos CIDR para sub-redes públicas"
  default     = ["10.0.0.0/24", "10.0.2.0/24", "10.0.4.0/24"]
}

variable "private_subnets_cidr_blocks" {
  type        = list(string)
  description = "Mapa de blocos CIDR para sub-redes privadas"
  default     = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
}

variable "availability_zones" {
  type        = list(string)
  description = "Lista de zonas de disponibilidade para as sub-redes"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}