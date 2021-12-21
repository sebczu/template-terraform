resource "kubernetes_namespace" "template-namespace" {
  depends_on = [google_container_node_pool.template-gke-node-pool]

  metadata {
    name = "template"
  }
}

resource "kubernetes_namespace" "nginx-namespace" {
  depends_on = [google_container_node_pool.template-gke-node-pool]

  metadata {
    name = "ingress-nginx"
  }
}
