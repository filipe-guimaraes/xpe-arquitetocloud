resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.vpc_name}-xpe"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.vpc_name}-igw-xpe"
  }
}

#Subnets Publicas
resource "aws_subnet" "publics" {
  count                   = length(var.public_subnets_cidr_blocks)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.public_subnets_cidr_blocks, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "public-subnet-${count.index + 1}-${element(var.availability_zones, count.index)}"
  }
}

#Subnets Privadas
resource "aws_subnet" "privates" {
  count                   = length(var.private_subnets_cidr_blocks)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = element(var.private_subnets_cidr_blocks, count.index)
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "private-subnet-${count.index + 1}-${element(var.availability_zones, count.index)}"
  }
}

# Route Table Pública
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Associações da route table pública
resource "aws_route_table_association" "public" {
  count          = length(var.public_subnets_cidr_blocks)
  subnet_id      = element(aws_subnet.publics[*].id, count.index)
  route_table_id = aws_route_table.public.id
}

# Route Table Privada
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.vpc_name}-private-rt"
  }
}

# Associações da route table privada
resource "aws_route_table_association" "private" {
  count          = length(var.private_subnets_cidr_blocks)
  subnet_id      = element(aws_subnet.privates[*].id, count.index)
  route_table_id = aws_route_table.private.id
}

# Security Group
resource "aws_security_group" "webserver" {
  name        = "${var.vpc_name}-webserver-sg"
  description = "Allow HTTP and HTTPS"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.vpc_name}-webserver-sg"
  }
}