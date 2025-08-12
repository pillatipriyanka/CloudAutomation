output "iam_policy_arn" {
  value = aws_iam_policy.custom.arn
}

output "iam_role_arn" {
  value = aws_iam_role.custom.arn
}

output "iam_role_name" {
  value = aws_iam_role.custom.name
}