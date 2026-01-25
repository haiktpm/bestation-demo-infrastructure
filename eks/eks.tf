module "eks" {
  source                          = "terraform-aws-modules/eks/aws"
  version                         = "21.15.1"
  cluster_name                    = "bestarion-demo"
  cluster_version                 = "1.33"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true
  cluster_addons                  = {
    coredns                       = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy                    = {}
    vpc-cni                       = {
      resolve_conflicts = "OVERWRITE"
    }
  }
  vpc_id                          = tolist(data.aws_vpcs.vpcs.ids)[0]
  subnet_ids                      = data.aws_subnet_ids.all_subnet.ids
  eks_managed_node_groups         = {
    default                       = {
      launch_template_name        = ""
      source                      = "terraform-aws-modules/eks/aws//modules/eks-managed-node-group"
      create_launch_template      = false
      name                        = "bestarion-demo"
      cluster_name                = "bestarion-demo"
      cluster_version             = "1.33"
      iam_role_attach_cni_policy  = true
      min_size                    = 1
      max_size                    = 10
      desired_size                = 2
      instance_types              = ["t2.small"]
      capacity_type               = "ON_DEMAND"
      tags                        = {
        creator                   = "bestarion-demo"
        cost                      = "bestarion-demo"
      }
      subnet_ids                  = data.aws_subnet_ids.private.ids
    }
  }
  tags = {
    creator                       = "bestarion-demo"
    cost                          = "bestarion-demo"
  }
}
