resource "helm_release" "template" {
  name  = "template"

  repository = "https://raw.githubusercontent.com/sebczu/helm-charts/master/"
  chart = "template"
  version = "0.0.1"

  repository_username = local.credential_github.username
  repository_password = local.credential_github.token
}