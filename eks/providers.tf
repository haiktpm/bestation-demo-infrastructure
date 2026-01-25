provider "aws" {
  region = "ap-southeast-1"
}

terraform {
  cloud {
    organization = "haiktpm"

    workspaces {
      name = "bestation-demo-infrastructure"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}