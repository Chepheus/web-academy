terraform {
  required_version = ">= 1.0.0"
  required_providers {
    minio = {
      source  = "refaktory/minio"
      version = "0.1.0"
    }
  }
}