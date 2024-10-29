output "dev_oidc_role_arn" {
  value       = module.oidc_dev.role_arn
  description = "value of the IAM role ARN"
}

output "prd_oidc_role_arn" {
  value       = module.oidc_prd.role_arn
  description = "value of the IAM role ARN"
}
