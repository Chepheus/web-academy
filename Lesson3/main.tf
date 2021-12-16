### Configure the GitLab Provider
provider "gitlab" {
  token    = var.gitlab_token
  base_url = var.gitlab_base_url
}

resource "gitlab_group" "test-group" {
  name        = "test-group"
  path        = "test-group"
  description = "Test group for GitLab"
}

resource "gitlab_project" "test-project" {
  name         = "test-project"
  description  = "Test project for GitLab"
  namespace_id = gitlab_group.test-group.id
}

### Configure MinIO

provider "minio" {
  endpoint   = format("%s:9000", var.minio_domain)
  access_key = var.minio_user_access_key
  secret_key = var.minio_user_secret_key
  ssl        = false
}

resource "minio_bucket" "bucket" {
  name = "bucket"
}

data "minio_canned_policy" "console_admin" {
  name = "consoleAdmin"
}

resource "minio_user" "test_user" {
  access_key = "test"
  secret_key = "test_test"
  policies = [
    data.minio_canned_policy.console_admin.name,
  ]
}