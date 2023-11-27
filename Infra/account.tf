resource "kubernetes_manifest" "traefik-account" {
  manifest = {
  "apiVersion" = "v1"
  "kind"=  "ServiceAccount"
  "metadata" = {
    "namespace" = "default"
    "name" = "traefik-account"
    }
  }
}