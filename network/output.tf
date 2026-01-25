
output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "id of the vpc"
}
output "public_subnets" {
  value       = module.vpc.public_subnets
  description = "public subnet ids"
}
output "private_subnets" {
  value       = module.vpc.private_subnets
  description = "private subnets ids"
}
