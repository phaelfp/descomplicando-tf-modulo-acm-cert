output "cert_arn" {
  description = "ARN do certificado SSL gerado no ACM."
  value       = aws_acm_certificate.cert.arn
}
