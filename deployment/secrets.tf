resource "kubernetes_secret" "jwt_private_key" {

    metadata {
      name = "jwt-keys" 
      namespace = kubernetes_namespace.demo.metadata.0.name
    }

    data = {
        PUBLIC_KEY = "-----BEGIN PUBLIC KEY-----\nMFYwEAYHKoZIzj0CAQYFK4EEAAoDQgAEA9Epm14+Zu2dMtFXZpDW0udcdNCSe0Y0\n13snh29Dyohn/RahRhKJnXdg+1zeNq8NqYJBFhHZt8lKsJyDLljRRQ==\n-----END PUBLIC KEY-----\n"
        PRIVATE_KEY = "-----BEGIN PRIVATE KEY-----\nMIGEAgEAMBAGByqGSM49AgEGBSuBBAAKBG0wawIBAQQg5BVuiMNsjkbWTebdPc8k\nZ2A/t5eVcsaAdLHCcI6+au2hRANCAAQD0SmbXj5m7Z0y0VdmkNbS51x00JJ7RjTX\neyeHb0PKiGf9FqFGEomdd2D7XN42rw2pgkEWEdm3yUqwnIMuWNFF\n-----END PRIVATE KEY-----\n"
    }

}

resource "kubernetes_secret" "postgres_credentials" {

  metadata {
    name = "postgres-credentials"
    namespace = kubernetes_namespace.demo.metadata.0.name
  }

  data = {
    DB_USER="user"
    DB_PASSWORD="password"
    DB_NAME="somedb"
    DB_HOST="postgres-service"
    DB_PORT=25060
  }
  
}