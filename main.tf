terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 1.0"
}

backend "remote" {
  organization = "Chinkes.com"
  workspaces {
    name = "AWS-Workspace-01"
  }
}
provider "aws" {
  profile = "default"
  region  = var.region
}
