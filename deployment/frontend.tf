resource "kubernetes_service" "frontend_service" {

  metadata {
    name      = "frontend-service"
    namespace = kubernetes_namespace.demo.metadata.0.name
  }

  spec {

    selector = {
      app = "frontend"
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"

  }

}

resource "kubernetes_deployment" "frontend_deployment" {

  metadata {
    name      = "frontend-deployment"
    namespace = kubernetes_namespace.demo.metadata.0.name
    labels = {
      app = "frontend"
    }
  }

  spec {

    replicas = 1

    selector {
      match_labels = {
        app = "frontend"
      }
    }

    template {

      metadata {
        labels = {
          app = "frontend"
        }
      }

      spec {

        container {
          image = "rozaydin/frontend"
          name  = "frontend"
          image_pull_policy = "Always"
          # image_pull_policy = "IfNotPresent"

          env_from {

            config_map_ref {
              name = kubernetes_config_map.app_env.metadata.0.name
            }

          }

          port {
            container_port = 80
          }

          resources {

            limits = {
              cpu    = "400m"
              memory = "512Mi"
            }
            requests = {
              cpu    = "400m"
              memory = "512Mi"
            }

          }

        }

      }

    }

  }

}
