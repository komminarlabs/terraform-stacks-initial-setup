locals {
  tfc_hostname             = "app.terraform.io"
  tfc_organization         = "KomminarLabs"
  tfc_project              = "Demo"
  github_oauth_client_name = "GitHub"

  stacks = {
    terraform-stacks-demo = {
      description     = "Demo Stack",
      repo_identifier = "komminarlabs/terraform-stacks-demo"
    }
  }
}

data "tls_certificate" "terraform" {
  url = "https://${local.tfc_hostname}"
}

resource "aws_iam_openid_connect_provider" "terraform" {
  url             = "https://${local.tfc_hostname}"
  client_id_list  = ["aws.workload.identity"]
  thumbprint_list = [data.tls_certificate.terraform.certificates[0].sha1_fingerprint]
}

module "oidc_dev" {
  source = "./modules/oidc"

  tfc_organization    = local.tfc_organization
  tfc_project         = local.tfc_project
  name                = "DemoDev"
  openid_provider_arn = aws_iam_openid_connect_provider.terraform.arn
}

module "oidc_prd" {
  source = "./modules/oidc"

  tfc_organization    = local.tfc_organization
  tfc_project         = local.tfc_project
  name                = "DemoPrd"
  openid_provider_arn = aws_iam_openid_connect_provider.terraform.arn
}

module "stacks" {
  for_each = local.stacks

  source = "./modules/stacks"

  tfc_organization         = local.tfc_organization
  tfc_project              = local.tfc_project
  name                     = each.key
  description              = each.value.description
  github_oauth_client_name = local.github_oauth_client_name
  repo_identifier          = each.value.repo_identifier
}
