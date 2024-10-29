data "tfe_project" "demo" {
  name         = local.tfc_project
  organization = local.tfc_organization
}

resource "tfe_variable_set" "role_arn" {
  name         = "stacks_oidc_role_arn"
  description  = "Role ARN for the stacks"
  organization = local.tfc_organization
}

resource "tfe_variable" "dev" {
  key             = "dev"
  value           = module.oidc_dev.role_arn
  category        = "terraform"
  description     = "Role ARN for the dev stacks"
  variable_set_id = tfe_variable_set.role_arn.id
}

resource "tfe_variable" "prd" {
  key             = "prd"
  value           = module.oidc_prd.role_arn
  category        = "terraform"
  description     = "Role ARN for the prd stacks"
  variable_set_id = tfe_variable_set.role_arn.id
}

resource "tfe_project_variable_set" "demo" {
  project_id      = data.tfe_project.demo.id
  variable_set_id = tfe_variable_set.role_arn.id
}
