resource "kubernetes_ingress_v1" "application" {

  metadata {
    name      = "demo"
    namespace = kubernetes_namespace.demo.metadata.0.name
    annotations = {
      # Required
      "kubernetes.io/ingress.class" = "nginx"
    }
  }

  spec {
    tls {
      hosts = [ "demo.ridvanozaydin.com", "api.ridvanozaydin.com" ]
      secret_name = "demo-tls"
    }
    
    rule {
      host = "demo.ridvanozaydin.com"
      http {
        path {
          path = "/"
          backend {
            service {
              name = kubernetes_service.frontend_service.metadata.0.name
              port {
                number = 80
              }
            }

          }
        }
      }
    }

    rule {
      host = "api.ridvanozaydin.com"
      http {
        path {
          path = "/"
          backend {
            service {
              name = kubernetes_service.backend_service.metadata.0.name
              port {
                number = 8058
              }
            }

          }
        }
      }
    }
  }

}
