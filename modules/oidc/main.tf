data "aws_iam_policy_document" "assume_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.openid_provider_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "app.terraform.io:aud"
      values   = ["aws.workload.identity"]
    }

    condition {
      test     = "StringLike"
      variable = "app.terraform.io:sub"
      values   = ["organization:${var.tfc_organization}:project:${var.tfc_project}:stack:*:*"]
    }
  }
}

module "stacks_iam_role" {
  source  = "schubergphilis/mcaf-role/aws"
  version = "0.4.0"

  name          = "${title(var.tfc_organization)}${title(var.tfc_project)}${title(var.name)}Stacks"
  assume_policy = data.aws_iam_policy_document.assume_policy.json

  policy_arns = [
    "arn:aws:iam::aws:policy/IAMFullAccess",
    "arn:aws:iam::aws:policy/PowerUserAccess",
  ]
}
