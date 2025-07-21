resource "aws_security_group" "webserver" {
  name        = "${var.project_name}-webserver-sg"
  description = "Permitir trafego HTTP e HTTPS"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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
    Name = "${var.project_name}-webserver-sg"
  }
}

resource "aws_instance" "web" {
  count                     = length(var.azs)
  ami                       = var.ami_id
  instance_type             = var.instance_type
  subnet_id                 = var.private_subnet_ids[count.index]
  vpc_security_group_ids    = [aws_security_group.webserver.id]
  associate_public_ip_address = false

  user_data = <<-EOF
              #!/bin/bash
              sudo apt update -y
              sudo apt install nginx -y
              sudo systemctl enable nginx
              sudo systemctl start nginx
              echo "Instância Web $(hostname)" > /var/www/html/index.html
              EOF

  tags = {
    Name = "${var.project_name}-web-${count.index + 1}"
  }
}