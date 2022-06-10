resource "kubernetes_service" "backend_service" {

  metadata {
    name      = "backend-service"
    namespace = kubernetes_namespace.demo.metadata.0.name
  }

  spec {

    selector = {
      app = "backend"
    }

    port {
      port        = 8058
      target_port = 8058
    }

    type = "ClusterIP"

  }

}

resource "kubernetes_deployment" "backend_deployment" {

  metadata {
    name      = "backend-deployment"
    namespace = kubernetes_namespace.demo.metadata.0.name
    labels = {
      app = "backend"
    }
  }

  spec {

    replicas = 1

    selector {
      match_labels = {
        app = "backend"
      }
    }

    template {

      metadata {
        labels = {
          app = "backend"
        }
      }

      spec {

        container {
          image = "rozaydin/backend"
          name  = "backend"
          image_pull_policy = "Always"
          # image_pull_policy = "IfNotPresent"

          env_from {

            config_map_ref {
              name = kubernetes_config_map.app_env.metadata.0.name
            }           

          }

          env_from {

            secret_ref {
              name = kubernetes_secret.jwt_private_key.metadata.0.name
            }

          }

          env_from {

            secret_ref {
              name = kubernetes_secret.postgres_credentials.metadata.0.name
            }

          }

          port {
            container_port = 8058
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
