resource "kubernetes_service" "postgres_service" {

  metadata {
    name      = "postgres-service"
    namespace = kubernetes_namespace.demo.metadata.0.name
  }

  spec {

    port {
      protocol    = "TCP"
      port        = 25060
      target_port = 25060
    }

    type          = "ExternalName"
    external_name = "some.db.ondigitalocean.com"

  }

}
