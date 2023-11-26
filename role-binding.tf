resource "kubernetes_cluster_role_binding" "traefik-role-binding" {
  metadata {
    name = "traefik-role-binding"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "traefik-role"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "traefik-account"
    namespace = "default"
  }
}