terraform {
  required_version = ">= 1.0.0"
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "~>3.8.0"
    }
    minio = {
      source  = "refaktory/minio"
      version = "0.1.0"
    }
  }
}