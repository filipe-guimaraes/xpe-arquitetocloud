variable "project_name" {
  type        = string
  description = "Nome base do projeto"
  default     = "xpe-atividademodular" #Você pode alterar o nome do projeto conforme necessário
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16" #Range da VPC
  description = "CIDR block da VPC"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.0.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.3.0/24"]
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "instance_type" {
  type    = string
  default = "t3a.small"
}

variable "ami_id" {
  type        = string
  description = "AMI ID para EC2"
  default     = "ami-0a7d80731ae1b2435" # Ubuntu 22.04 LTS (us-east-1)
}
