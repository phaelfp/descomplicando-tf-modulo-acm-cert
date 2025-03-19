module "acm_cert" {
  source         = "../"
  subdomain_name = var.subdomain_name
}
