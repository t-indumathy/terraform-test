run "setup" {
  module {
    source = "./tests/fixtures/setup"
  }
}


run "validate_gcs_bucket_name" {
 
  module {
    source = "./tests/fixtures"
  }

  assert {
    condition = module.gcs.name == "innov-g001-tpnb-1-bucket"
    error_message = "GCS Bucket Name does not match"
  }
}

run "validate_versioning" {
  
  module {
    source = "./tests/fixtures"
  }

  assert {
    condition = module.gcs.versioning == true
    error_message = "GCS Bucket Versioning Flag is not enabled"
  }
}