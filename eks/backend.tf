terraform {
  backend "s3" {
    bucket         = "my-tfstate-bk"
    key            = "eks/eks.tfstate"
    region         = "ap-southeast-1"
  }
}
