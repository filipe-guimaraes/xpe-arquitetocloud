output "id_da_minha_vpc" {
  description = "ID of the VPC created"
  value       = aws_vpc.main.id
}

output "id_da_subrede_publica" {
  description = "IDs of the public subnets created"
  value       = aws_subnet.publics[*].id
}
output "name_da_subrede_publica" {
  description = "Names of the public subnets created"
  value       = aws_subnet.publics[*].tags["Name"]
}