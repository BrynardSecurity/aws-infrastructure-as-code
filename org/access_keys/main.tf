resource "aws_iam_policy" "policy" {
  name        = "iam_create_own_access_keys"
  path        = "/"
  description = "Policy to allow each IAM to create it's own access key."

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
        {
            Sid = "ManageOwnAccessKeys"
            Effect = "Allow"
            Action = [
                "iam:CreateAccessKey",
                "iam:DeleteAccessKey",
                "iam:GetAccessKeyLastUsed",
                "iam:GetUser",
                "iam:ListAccessKeys",
                "iam:UpdateAccessKey",
            ]
            Resource = "arn:aws:iam::*:user/$${aws:username}"
        }
    ]
})
}