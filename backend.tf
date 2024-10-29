terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "KomminarLabs"

    workspaces {
      name = "terraform-stacks-initial-setup"
    }
  }
}
