locals {
  credential_gcloud_sql = jsondecode(file("/scripts/credential_gcloud_sql.json"))
}

resource "random_string" "template-sql-database-random" {
  length  = 4
  upper   = false
  special = false
}

resource "google_sql_database_instance" "template-sql-database-instance" {
  name             = "template-sql-database-instance-${random_string.template-sql-database-random.result}"
  database_version = var.mysql-version
  region           = var.region

  deletion_protection = false

  settings {
    tier        = "db-f1-micro"
    disk_size   = 10
    disk_type   = "PD_HDD"

    backup_configuration {
      enabled   = false
    }

    maintenance_window {
      day   = 1
      hour  = 3
      update_track = "stable"
    }
  }
}

resource "google_sql_user" "template-sql-user" {
  instance = google_sql_database_instance.template-sql-database-instance.name
  name     = local.credential_gcloud_sql.username
  password = local.credential_gcloud_sql.password
}

resource "google_sql_database" "template-sql-database" {
  name     = "template"
  instance = google_sql_database_instance.template-sql-database-instance.name
}
