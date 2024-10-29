data "tfe_oauth_client" "github" {
  name             = var.github_oauth_client_name
  organization     = var.tfc_organization
  service_provider = "github"
}

data "tfe_project" "default" {
  name         = var.tfc_project
  organization = var.tfc_organization
}

resource "tfe_stack" "default" {
  name        = var.name
  description = var.description
  project_id  = data.tfe_project.default.id

  vcs_repo {
    branch         = "main"
    identifier     = var.repo_identifier
    oauth_token_id = data.tfe_oauth_client.github.oauth_token_id
  }
}
