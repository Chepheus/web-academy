variable "gitlab_base_url" {
  type    = string
  default = "http://gitlab.example.com/api/v4"
}

variable "gitlab_token" {
  type      = string
  default   = "sQRcYx4GAxVDQzTXpbS5"
  sensitive = true
}

variable "gitlab_project_list" {
  type = list(string)
}