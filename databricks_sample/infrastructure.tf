# this example assumes that Databricks and Tecton are deployed to the same account

provider "aws" {
  region = "us-east-1"
}

locals {
  deployment_name = "locals"
  region          = "us-east-1"
  account_id      = "476964136024"

  # Name of role and instance profile used by Databricks
  spark_role_name             = "db-c5ef34f5e29606682e600455d6fea1c8-iam-role"
  spark_instance_profile_name = "databricks-instance-profile"

  databricks_workspace = "dbc-d21f6fa6-61ef.cloud.databricks.com"

  # Get from your Tecton rep
  tecton_assuming_account_id = "153453085158"
}

resource "random_id" "external_id" {
  byte_length = 16
}

module "tecton" {
  providers = {
    aws = aws
  }
  source                     = "../deployment"
  deployment_name            = local.deployment_name
  account_id                 = local.account_id
  tecton_assuming_account_id = local.tecton_assuming_account_id
  region                     = local.region
  cross_account_external_id  = resource.random_id.external_id.id

  databricks_spark_role_name = local.spark_role_name
}
