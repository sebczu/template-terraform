resource "kubernetes_secret" "registry-credential" {
  metadata {
    name = "registry-credential"
    namespace= "template"
  }
  type = "kubernetes.io/dockerconfigjson"
  data = {
    ".dockerconfigjson" = file("/scripts/credential_dockerhub.json")
  }
}
