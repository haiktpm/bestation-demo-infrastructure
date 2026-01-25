terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.63"
    }
    tls = {
      source  = "hashicorp/tls"
      version = ">= 3.1.0"
    }
    vault = {
      source  = "hashicorp/vault"
      version = ">= 3.3.1"
    }
  }
}
