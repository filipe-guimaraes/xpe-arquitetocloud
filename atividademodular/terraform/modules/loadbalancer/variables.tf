variable "project_name" {
  type        = string
  description = "Nome do projeto base para os recursos"
}

variable "vpc_id" {
  type        = string
  description = "ID da VPC"
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Subnets públicas onde o ALB será provisionado"
}

variable "instance_ids" {
  type        = list(string)
  description = "Lista de IDs das instâncias que farão parte do Target Group"
}

variable "security_group_id" {
  type        = string
  description = "ID do Security Group associado ao ALB"
}
