data "aws_vpcs" "vpcs" {
  tags      = {
    creator = "bestarion-demo"
    cost    = "bestarion-demo"
    }
}
data "aws_subnets" "all_subnet" {
  filter {
    name   = "vpc-id"
    values = tolist(data.aws_vpcs.vpcs.ids)[0]
  }
  tags      = {
    App     = "k8s"
  }
}
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = tolist(data.aws_vpcs.vpcs.ids)[0]
  }
  tags      = {
    Type    = "Private"
  }
}
