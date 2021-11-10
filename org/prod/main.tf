resource "aws_organizations_account" "dev" {
  # A friendly name for the member account
  name  = var.aws_account_friendly_name
  email = var.aws_account_email

  # Enables IAM users to access account billing information 
  # if they have the required permissions
  iam_user_access_to_billing = "ALLOW"

  tags = {
    Name  = "brynardsecurity-prod"
    Owner = "Ralph"
    Role  = "production"
  }
}