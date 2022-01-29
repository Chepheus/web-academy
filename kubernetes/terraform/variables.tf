variable "kubernetes_namespace_name" {
  type    = string
  default = "test"
}

variable "kubernetes_application_name" {
  type    = string
  default = "MyApp"
}

variable "kubernetes_container_name" {
  type    = string
  default = "nginx-container"
}

variable "kubernetes_container_port" {
  type    = number
  default = 80
}

variable "kubernetes_node_port_port" {
  type    = number
  default = 30201
}