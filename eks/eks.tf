module "eks" {
  source                          = "terraform-aws-modules/eks/aws"
  version                         = "~> 21.0"
  name                            = "bestarion-demo"
  enable_cluster_creator_admin_permissions = true
  authentication_mode             = "API_AND_CONFIG_MAP"
  kubernetes_version              = "1.33"
  endpoint_public_access          = true
  addons                          = {
    coredns                       = {}
    kube-proxy                    = {}
    vpc-cni                       = {}
  }
  vpc_id                          = tolist(data.aws_vpcs.vpcs.ids)[0]
  subnet_ids                      = data.aws_subnets.all_subnet.ids
  eks_managed_node_groups         = {
    default = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["m5.large"]
      min_size     = 1
      max_size     = 2
      metadata_options = {
        http_endpoint = "enabled"
        http_tokens   = "required"
        http_put_response_hop_limit = 2 # Recommended for security best practices
      }
    }
  }
  tags = {
    creator                       = "bestarion-demo"
    cost                          = "bestarion-demo"
  }
}
