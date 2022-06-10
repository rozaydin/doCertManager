resource "kubernetes_manifest" "frontend_vertical_pod_autoscaler" {
  manifest = {
    "apiVersion" = "autoscaling.k8s.io/v1"
    "kind"       = "VerticalPodAutoscaler"
    "metadata" = {
      "name"      = "frontend-vertical-scaler"
      "namespace" = "demo"
    }
    "spec" = {
      "targetRef" = {
        "apiVersion" = "apps/v1"
        "kind"       = "Deployment"
        "name"       = "frontend-deployment"
      }
      "updatePolicy" = {
        "updateMode"  = "Auto"
        "minReplicas" = 1
      }
      "resourcePolicy" = {
        "containerPolicies" = [
          {
            "containerName" : "*"
            "minAllowed" : {
              "cpu" : "100m"
              "memory" : "100Mi"
            }
            "maxAllowed" : {
              "cpu" : "400m"
              "memory" : "256Mi"
            }
          }
        ]
      }
    }
  }
}


resource "kubernetes_manifest" "backend_vertical_pod_autoscaler" {
  manifest = {
    "apiVersion" = "autoscaling.k8s.io/v1"
    "kind"       = "VerticalPodAutoscaler"
    "metadata" = {
      "name"      = "backend-vertical-scaler"
      "namespace" = "demo"
    }
    "spec" = {
      "targetRef" = {
        "apiVersion" = "apps/v1"
        "kind"       = "Deployment"
        "name"       = "backend-deployment"
      }
      "updatePolicy" = {
        "updateMode"  = "Auto"
        "minReplicas" = 1
      }
      "resourcePolicy" = {
        "containerPolicies" = [
          {
            "containerName" : "*"
            "minAllowed" : {
              "cpu" : "100m"
              "memory" : "100Mi"
            }
            "maxAllowed" : {
              "cpu" : "400m"
              "memory" : "256Mi"
            }
          }
        ]
      }
    }
  }
}
