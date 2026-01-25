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
}