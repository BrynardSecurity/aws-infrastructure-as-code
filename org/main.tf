terraform {
    backend "remote" {
        organization = "BrynardSecurity"
        
        workspaces {
            name = "aws-infrastructure-as-code"
        }
    }
}

provider "aws" {
    region = var.aws_region
    profile = "default"
}
module "dev" {
    source = "./dev" 
    aws_account_friendly_name = "brynardsecurity-dev"
    aws_account_email = "dev.aws.us@thebrynards.com"
}
module "prod" {
    source = "./prod"
    aws_account_friendly_name = "brynardsecurity-prod"
    aws_account_email = "prod.aws.us@thebrynards.com"
}
module "test" {
    source = "./test"
    aws_account_friendly_name = "brynardsecurity-test"
    aws_account_email = "test.aws.us@thebrynards.com"
}
module "cloud_optix" {
    source = "./cloud_optix/terraform"
    a_permission_prompt = "yes"
    customer_id = var.customer_id
    external_id = var.external_id
    dns_prefix_cloudtrail = var.dns_prefix_cloud_trail
    dns_prefix_flowlogs = var.dns_prefix_flowlogs
    aws_region = var.aws_region
}
module "access_keys" {
    source = "./access_keys"
}