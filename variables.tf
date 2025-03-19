variable "subdomain_name" {
  description = "Nome do subdomínio para gerar o certificado SSL."
  type        = string
}

variable "aws_region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}
