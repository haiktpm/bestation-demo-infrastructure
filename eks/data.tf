data "aws_vpcs" "vpcs" {
  tags      = {
    creator = "bestarion-demo"
    cost    = "bestarion-demo"
    }
}
data "aws_subnet_ids" "all_subnet" {
  vpc_id    = tolist(data.aws_vpcs.vpcs.ids)[0]
  tags      = {
    App     = "k8s"
  }
}
data "aws_subnet_ids" "private" {
  vpc_id    = tolist(data.aws_vpcs.vpcs.ids)[0]
  tags      = {
    Type    = "Private"
  }
}
