terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.57.0"
    }
  }
}
