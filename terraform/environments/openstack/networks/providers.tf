terraform {
  backend "s3" {
    endpoints = {
      s3 = "http://backup-01.core.internal:9000"
    }
    bucket                      = "terraform-state"
    key                         = "openstack/networks/terraform.tfstate"
    region                      = "main"
    use_path_style              = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    skip_region_validation      = true
  }

  required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.53.0"
    }
  }
}

provider "openstack" {
  auth_url    = var.os_auth_url
  user_name   = var.os_username
  password    = var.os_password
  tenant_name = var.os_project
  region      = var.os_region
}
