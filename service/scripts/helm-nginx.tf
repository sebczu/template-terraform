resource "helm_release" "nginx" {
  name  = "nginx"

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart = "ingress-nginx"
  version = "4.0.13"

  namespace = "ingress-nginx"
}