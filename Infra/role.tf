resource "kubernetes_cluster_role" "traefik-role" {

  depends_on = [ 
    kubernetes_manifest.traefik-account
   ]

  metadata {
    name = "traefik-role"
  }

  rule {
    api_groups = [""]
    resources  = ["services", "endpoints", "secrets"]
    verbs      = ["get", "list", "watch"]
  }

  rule {
    api_groups = ["extensions","networking.k8s.io"]
    resources  = ["ingresses", "ingressclasses"]
    verbs      = ["get", "list", "watch"]
  }

  rule {
    api_groups = ["extensions","networking.k8s.io"]
    resources  = ["ingresses/status"]
    verbs      = ["update"]
  }
}