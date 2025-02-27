output "cross_account_role_arn" {
  value = aws_iam_role.cross_account_role.arn
}
output "spark_role_name" {
  value = local.spark_role_name
}
output "emr_master_role_name" {
  value = var.create_emr_roles ? aws_iam_role.emr_master_role[0].name : null
}
