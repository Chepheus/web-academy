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
  for_each   = { for record in var.minio_user_list : record.access_key => record }
  access_key = each.value.access_key
  secret_key = each.value.secret_key
  policies = [
    data.minio_canned_policy.console_admin.name,
  ]
}