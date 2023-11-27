resource "kubernetes_cluster_role_binding" "traefik-role-binding" {

  depends_on = [ 
    kubernetes_cluster_role.traefik-role
   ]

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