resource "helm_release" "user" {
  name        = "user"
  depends_on  = [kubernetes_namespace.template-namespace]

  repository  = "https://raw.githubusercontent.com/sebczu/helm-charts/master/"
  chart       = "user"
  version     = "0.0.1"

  repository_username = local.credential_github.username
  repository_password = local.credential_github.token

  set {
    name  = "gcloud.sql.connection"
    value = google_sql_database_instance.template-sql-database-instance.connection_name
  }

  set {
    name  = "gcloud.credential"
    value = filebase64(var.credential-gcloud)
  }

  set {
    name  = "database.username"
    value = google_sql_user.template-sql-user.name
  }

  set {
    name  = "database.password"
    value = google_sql_user.template-sql-user.password
  }
}