resource "helm_release" "nginx" {
  name  = "nginx"
  depends_on = [kubernetes_namespace.nginx-namespace]

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart = "ingress-nginx"
  version = "4.0.13"

  namespace = "ingress-nginx"
}