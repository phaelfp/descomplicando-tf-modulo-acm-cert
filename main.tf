resource "aws_acm_certificate" "cert" {
  domain_name       = var.subdomain_name
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}
