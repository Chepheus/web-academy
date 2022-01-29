terraform {
  required_version = ">= 1.0.0"
  required_providers {
    gitlab = {
      source  = "hashicorp/kubernetes"
      version = "~>2.7.1"
    }
  }
}