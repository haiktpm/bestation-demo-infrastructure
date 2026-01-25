terraform {
  backend "s3" {
    bucket         = "my-tfstate-bk"
    key            = "network/network.tfstate"
    region         = "ap-southeast-1"
  }
}
