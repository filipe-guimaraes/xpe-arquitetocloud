variable "project_name" {
  type        = string
  description = "Nome do projeto base para os recursos"
}

variable "vpc_id" {
  type        = string
  description = "ID da VPC onde as instâncias serão criadas"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "Lista de subnets privadas para as instâncias"
}

variable "ami_id" {
  type        = string
  description = "AMI a ser usada nas instâncias EC2"
}

variable "instance_type" {
  type        = string
  description = "Tipo da instância EC2"
}

variable "azs" {
  type        = list(string)
  description = "Lista de zonas de disponibilidade para as instâncias"
  default     = ["us-east-1a", "us-east-1b"]
}
