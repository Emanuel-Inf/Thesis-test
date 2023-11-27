resource "kubernetes_deployment" "traefik-deployment" {
  
  depends_on = [ 
    kubernetes_service.web 
  ]
  metadata {
    name = "traefik-deployment"
    labels = {
      app = "traefik"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "traefik"
      }
    }

    template {
      metadata {
        labels = {
          app = "traefik"
        }
      }

      spec {
        service_account_name = "traefik-account"
        container {
          image = "traefik:v2.10"
          name  = "traefik"
          args = ["--api.insecure","--providers.kubernetesingress"]

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
          port{
            name = "web"
            container_port = "80"
          }
          port{
            name = "dashboard"
            container_port = "8080"
          }

        }
      }
    }
  }
}