data "google_project" "project" {
}

resource "google_project_service" "project" {
  project = data.google_project.project.id
  service = "serviceusage.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
  disable_on_destroy = false
}