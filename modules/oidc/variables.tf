variable "tfc_organization" {
  type = string
}

variable "tfc_project" {
  type = string
}

variable "name" {
  type        = string
  description = "The name for the Stack"
}

variable "openid_provider_arn" {
  type        = string
  description = "The ARN of the OpenID Connect provider"
}
