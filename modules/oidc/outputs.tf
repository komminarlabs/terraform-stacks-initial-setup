output "role_arn" {
  value       = module.stacks_iam_role.arn
  description = "value of the IAM role ARN"
}
