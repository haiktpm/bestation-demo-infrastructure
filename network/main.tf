module "vpc" {
  source                 = "terraform-aws-modules/vpc/aws"
  name                   = "bestarion-demo-vpc"
  cidr                   = "192.168.0.0/16"
  azs                    = ["ap-southeast-1a", "ap-southeast-1b"]
  private_subnets        = ["192.168.1.0/24", "192.168.2.0/24"]
  private_subnet_tags    = { Type = "Private", App = "k8s"}
  public_subnets         = ["192.168.3.0/24", "192.168.4.0/24"]
  public_subnet_tags     = { Type = "Public", App = "k8s" }
  map_public_ip_on_launch = true
  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  enable_vpn_gateway     = false
  enable_dns_hostnames   = true
  enable_dns_support     = true
  tags                   = {
    creator              = "bestarion-demo"
    cost                 = "bestarion-demo"
}
  
}
