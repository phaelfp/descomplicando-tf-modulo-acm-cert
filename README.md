# Projeto de Conclusão de Curso do Descomplicando Terraform

## Modulo de Certificado SSL (acm-cert)

Este módulo é responsável por criar um certificado ssl da amazon para utilizar em um Load Balancer.

A documentação do módulo gerada pelo terraform-docs se encontra [aqui](README.TF.md)

## Exemplo de uso

Tem um exemplo completo do uso no diretório exemple caso queira ir logo para a parte prática.

Precisamos da seguinte estrutura de arquivos.

```css
│── main.tf
│── provider.tf
│── variables.tf
│── outputs.tf
```

### provider.tf

```tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

```

Não se esqueça que o bucket s3 e o dynamodb tem que existir para funcionar.

### variavles.tf

```tf
variable "subdomain_name" {
  default = "api.exemplo.com"
}

variable "aws_region" {
  default = "us-east-1"
}

```

Temos aqui 2 variáveis uma para idendificar a região.

A Outra com o nome do subdomínio que será criado o certificado digital ssl

### main.tf

```tf
module "acm_cert" {
  source         = "../"
  subdomain_name = var.subdomain_name
}

```

Este main.tf o source está apontando para a pasta raiz, mas se você estiver já utilizando o módulo em outro utilize o código abaixo que está apontando para o repositório git

```tf
module "acm_cert" {
  source         = "github.com/phaelfp/descomplicando-tf-modulo-acm-cert?ref=v1.0.0"

  subdomain_name = var.subdomain_name
}

```

### output.tf

```tf
output "cert_arn" {
  description = "ARN do certificado SSL gerado no ACM."
  value       = module.acm_cert.cert_arn
}


```

### Execução

Tendo as chaves de acesso a AWS configuradas no terminal corretamente é só executar os comando abaixo.

```sh
terraform init
terraform plan -out tfplan
terraform apply "tfplan"
```
