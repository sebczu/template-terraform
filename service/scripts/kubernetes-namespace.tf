resource "kubernetes_namespace" "template-namespace" {
  metadata {
    name = "template"
  }
}

resource "kubernetes_namespace" "nginx-namespace" {
  metadata {
    name = "ingress-nginx"
  }
}
