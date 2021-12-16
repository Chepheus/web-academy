### GitLab variables
variable "gitlab_base_url" {
  type    = string
  default = "http://gitlab.example.com/api/v4"
}

variable "gitlab_token" {
  type      = string
  default   = "sQRcYx4GAxVDQzTXpbS5"
  sensitive = true
}


### MinIO variables
variable "minio_domain" {
  type    = string
  default = "minio.example.com"
}

variable "minio_user_access_key" {
  type = string
}

### MinIO variables
variable "minio_user_secret_key" {
  type      = string
  sensitive = true
}