
output "cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "eks cluster endpoint"
}
output "ecr_repo" {
  value       = aws_ecr_repository.xd-ecr.repository_url
  description = "ecr_repo"
}
