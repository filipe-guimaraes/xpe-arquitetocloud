data "aws_route53_zone" "this" {
  name         = "multicloud.awsdiretoaoponto.com.br."
  private_zone = false
}

# Health check para a instância EC2 (primária)
resource "aws_route53_health_check" "aws" {
  ip_address = aws_eip.web_eip.public_ip
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = 3
  request_interval  = 10

  tags = {
    Name = "aws-health-check"
  }
}

# Health check para a instância Azure (secundária)
resource "aws_route53_health_check" "azure" {
  ip_address = var.azurewebserver_public_ip
  port              = 80
  type              = "HTTP"
  resource_path     = "/"
  failure_threshold = 3
  request_interval  = 10

  tags = {
    Name = "azure-health-check"
  }
}

resource "aws_route53_record" "primary_aws" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "www.multicloud.awsdiretoaoponto.com.br"
  type    = "A"
  set_identifier = "primary-aws"
  failover_routing_policy {
    type = "PRIMARY"
  }
  ttl     = 60
  records = [aws_eip.web_eip.public_ip]
  health_check_id = aws_route53_health_check.aws.id
}

resource "aws_route53_record" "secondary_azure" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "www.multicloud.awsdiretoaoponto.com.br"
  type    = "A"
  set_identifier = "secondary-azure"
  failover_routing_policy {
    type = "SECONDARY"
  }
  ttl     = 60
  records = [var.azurewebserver_public_ip]
  health_check_id = aws_route53_health_check.azure.id
}