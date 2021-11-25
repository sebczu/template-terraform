resource "kubernetes_namespace" "template-namespace" {
  metadata {
    name = "template"
  }
}
