resource "aws_route53_zone" "main_dns_zone" {
  name = "${var.main_dns_zone}."

  tags = {
    Name      = var.main_dns_zone
    terraform = "true"
  }
}
