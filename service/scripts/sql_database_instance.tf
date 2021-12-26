locals {
  credential_gcloud_sql = jsondecode(file("/scripts/credential_gcloud_sql.json"))
}

resource "random_integer" "template-sql-database-random" {
  min = 1
  max = 10000
}

resource "google_sql_database_instance" "template-sql-database" {
  name             = "template-sql-database-${random_integer.template-sql-database-random.result}"
  database_version = var.mysql-version
  region           = var.region

  settings {
    tier        = "db-f1-micro"
    disk_size   = 10
    disk_type   = "PD_HDD"

    backup_configuration {
      enabled   = false
    }
  }
}

resource "google_sql_user" "template-sql-user" {

  instance = google_sql_database_instance.template-sql-database.name
  name     = local.credential_gcloud_sql.username
  password = local.credential_gcloud_sql.password
}