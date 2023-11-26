resource "kubernetes_service_account" "traefik-account" {
  metadata {
    name = "traefik-account"
  }
}
