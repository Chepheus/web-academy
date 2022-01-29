provider "kubernetes" {
  config_path = "~/.kube/config"
}
resource "kubernetes_namespace" "test" {
  metadata {
    name = var.kubernetes_namespace_name
  }
}
resource "kubernetes_deployment" "test" {
  metadata {
    name      = var.kubernetes_namespace_name
    namespace = kubernetes_namespace.test.metadata.0.name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = var.kubernetes_application_name
      }
    }
    template {
      metadata {
        labels = {
          app = var.kubernetes_application_name
        }
      }
      spec {
        container {
          image = "nginx"
          name  = var.kubernetes_container_name
          port {
            container_port = var.kubernetes_container_port
          }
        }
      }
    }
  }
}
resource "kubernetes_service" "test" {
  metadata {
    name      = var.kubernetes_namespace_name
    namespace = kubernetes_namespace.test.metadata.0.name
  }
  spec {
    selector = {
      app = kubernetes_deployment.test.spec.0.template.0.metadata.0.labels.app
    }
    type = "NodePort"
    port {
      node_port   = var.kubernetes_node_port_port
      port        = var.kubernetes_container_port
      target_port = var.kubernetes_container_port
    }
  }
}