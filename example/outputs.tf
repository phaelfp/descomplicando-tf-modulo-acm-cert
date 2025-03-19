output "cert_arn" {
  description = "ARN do certificado SSL gerado no ACM."
  value       = module.acm_cert.cert_arn
}
