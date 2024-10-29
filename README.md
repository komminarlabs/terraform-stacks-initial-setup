# terraform-stacks-initial-setup

This repository contains configurations to deploy an IAM OIDC setup for Terraform Stacks. Additionally, you can provision the Stacks directly from this repository.

## Modules

### `oidc`

This module creates an IAM role that can be assumed by entities that have authenticated using a web identity provider.

### `stacks`

This module sets up a Terraform Cloud stack that is linked to a specific GitHub repository.

## Files

### `main.tf`

For demonstration purposes, this file creates two IAM roles, one for each environment, and sets up a Terraform stack.

### `variable_set.tf`

The created IAM roles are added as variable sets, allowing them to be accessed in the Terraform Stacks without hardcoding the IAM role ARN in the stack.
