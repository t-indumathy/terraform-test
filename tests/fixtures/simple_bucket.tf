data "google_project" "project" {
}

module "gcs" {
  source = "../.."

  name       = "${data.google_project.project.project_id}-bucket"
  project_id = data.google_project.project.project_id
  location   = "us"
  versioning = true

  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age            = 365
      with_state     = "ANY"
      matches_prefix = data.google_project.project.project_id
    }
  }]

  custom_placement_config = {
    data_locations : ["US-EAST4", "US-WEST1"]
  }

  iam_members = [{
    role   = "roles/storage.objectViewer"
    member = "user:ilk085170@etforge.com"
  }]

  autoclass = true
}