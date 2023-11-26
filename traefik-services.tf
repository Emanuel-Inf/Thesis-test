resource "kubernetes_service" "dashboard" {
  metadata {
    name = "traefik-dashboard-service"
  }
  spec {
    selector = {
      app = "traefik"
    }
    port {
      port        = 8080
      target_port = "dashboard"
    }

    type = "LoadBalancer"
  }
}

resource "kubernetes_service" "web" {
  metadata {
    name = "traefik-web-service"
  }
  spec {
    selector = {
      app = "traefik"
    }
    port {
      port        = 80
      target_port = "web"
    }

    type = "LoadBalancer"
  }
}
