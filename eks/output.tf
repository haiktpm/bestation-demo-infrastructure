
output "cluster_endpoint" {
  value       = module.eks.cluster_endpoint
  description = "eks cluster endpoint"
}
output "ecr_repo" {
  value       = aws_ecr_repository.bestarion-demo-ecr.repository_url
  description = "ecr_repo"
}
