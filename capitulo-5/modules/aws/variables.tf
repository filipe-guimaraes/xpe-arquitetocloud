variable "azs" {
  description = "List of availability zones to use for the resources"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]  
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.10.0.0/24", "10.10.2.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.10.1.0/24", "10.10.3.0/24"]
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string  
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-053b0d53c279acc90" # Ubuntu Server 22.04 LTS - us-east-1
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t3a.small"
}

variable "key_name" {
  description = "Key pair name for the EC2 instance"
  type        = string
}

variable "azurewebserver_public_ip" {
  description = "Public IP address of the Azure web server"
  type        = string
}