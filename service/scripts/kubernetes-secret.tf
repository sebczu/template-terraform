resource "kubernetes_secret" "registry-credential" {
  depends_on = [kubernetes_namespace.template-namespace]

  metadata {
    name = "registry-credential"
    namespace= "template"
  }
  type = "kubernetes.io/dockerconfigjson"
  data = {
    ".dockerconfigjson" = file("/scripts/credential_dockerhub.json")
  }
}
