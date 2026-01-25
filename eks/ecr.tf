resource "aws_ecr_repository" "xd-ecr" {
  name                 = "bestarion-demo-ecr"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = false
  }
  tags = {
    creator                       = "bestarion-demo"
    cost                          = "bestarion-demo"
  }
}