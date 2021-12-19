variable "minio_domain" {
  type    = string
  default = "minio.example.com"
}

variable "minio_user_access_key" {
  type = string
}

variable "minio_user_secret_key" {
  type      = string
  sensitive = true
}

variable "minio_user_list" {
  type = list(object({
    access_key = string
    secret_key = string
  }))
}