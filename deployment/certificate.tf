resource "kubernetes_manifest" "certificate_application_koinrun" {
  manifest = {
    "apiVersion" = "cert-manager.io/v1"
    "kind" = "Certificate"
    "metadata" = {
      "name" = "demo-tls"
      "namespace" = "demo"
    }
    "spec" = {
      "dnsNames" = [
        "demo.ridvanozaydin.com",
        "api.ridvanozaydin.com",
      ]
      "issuerRef" = {
        "kind" = "ClusterIssuer"
        "name" = "letsencrypt-cluster-issuer"
      }
      "secretName" = "demo-tls"
    }
  }
}
