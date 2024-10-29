variable "tfc_organization" {
  type        = string
  description = "value of the Terraform Cloud organization"
}

variable "tfc_project" {
  type        = string
  description = "value of the Terraform Cloud project"
}

variable "name" {
  type        = string
  description = "The name for the Stack"
}

variable "description" {
  type        = string
  description = "The description for the Stack"
}

variable "github_oauth_client_name" {
  type        = string
  description = "The name of the OAuth client for GitHub"
}

variable "repo_identifier" {
  type        = string
  description = "The identifier for the VCS repository"
}
