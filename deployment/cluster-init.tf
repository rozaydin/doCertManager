resource "kubernetes_config_map" "app_env" {

  metadata {
    name      = "app-env"
    namespace = kubernetes_namespace.demo.metadata.0.name
  }

  data = local.application_environment

}

resource "kubernetes_namespace" "demo" {
  metadata {
    labels = {
      app = "demo"
    }

    name = "demo"
  }
}
