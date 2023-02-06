## Week 1 Homework
Name: John Bjorge

Completed: 2023-01-21

## Question 1. Creating Resources

### Answer

See terraform output below. This was my second run of terraform apply (after making changes), which is why it just shows changes to the location parameter.

#### Explanation

```
(base) jbjorge@de-zoomcamp:~/data-engineering-zoomcamp/week_1_basics_n_setup/1_terraform_gcp/terraform$ terraform apply
var.project
  Your GCP Project ID

  Enter a value: ny-rides-jbjorge

google_storage_bucket.data-lake-bucket: Refreshing state... [id=dtc_data_lake_ny-rides-jbjorge]
google_bigquery_dataset.dataset: Refreshing state... [id=projects/ny-rides-jbjorge/datasets/trips_data_all]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
-/+ destroy and then create replacement

Terraform will perform the following actions:

  # google_bigquery_dataset.dataset must be replaced
-/+ resource "google_bigquery_dataset" "dataset" {
      ~ creation_time                   = 1674373284413 -> (known after apply)
      - default_partition_expiration_ms = 0 -> null
      - default_table_expiration_ms     = 0 -> null
      ~ etag                            = "niif1eLzb+334rYeHUb2yA==" -> (known after apply)
      ~ id                              = "projects/ny-rides-jbjorge/datasets/trips_data_all" -> (known after apply)
      ~ labels                          = {} -> (known after apply)
      ~ last_modified_time              = 1674373284413 -> (known after apply)
      ~ location                        = "europe-west6" -> "us-west1" # forces replacement
      ~ self_link                       = "https://bigquery.googleapis.com/bigquery/v2/projects/ny-rides-jbjorge/datasets/trips_data_all" -> (known after apply)
        # (3 unchanged attributes hidden)

      + access {
          + domain         = (known after apply)
          + group_by_email = (known after apply)
          + role           = (known after apply)
          + special_group  = (known after apply)
          + user_by_email  = (known after apply)

          + dataset {
              + target_types = (known after apply)

              + dataset {
                  + dataset_id = (known after apply)
                  + project_id = (known after apply)
                }
            }

          + routine {
              + dataset_id = (known after apply)
              + project_id = (known after apply)
              + routine_id = (known after apply)
            }

          + view {
              + dataset_id = (known after apply)
              + project_id = (known after apply)
              + table_id   = (known after apply)
            }
        }
      - access {
          - role          = "OWNER" -> null
          - user_by_email = "de-zoomcamp-user@ny-rides-jbjorge.iam.gserviceaccount.com" -> null
        }
      - access {
          - role          = "OWNER" -> null
          - special_group = "projectOwners" -> null
        }
      - access {
          - role          = "READER" -> null
          - special_group = "projectReaders" -> null
        }
      - access {
          - role          = "WRITER" -> null
          - special_group = "projectWriters" -> null
        }
    }

  # google_storage_bucket.data-lake-bucket must be replaced
-/+ resource "google_storage_bucket" "data-lake-bucket" {
      - default_event_based_hold    = false -> null
      ~ id                          = "dtc_data_lake_ny-rides-jbjorge" -> (known after apply)
      - labels                      = {} -> null
      ~ location                    = "EUROPE-WEST6" -> "US-WEST1" # forces replacement
        name                        = "dtc_data_lake_ny-rides-jbjorge"
      ~ project                     = "ny-rides-jbjorge" -> (known after apply)
      ~ public_access_prevention    = "inherited" -> (known after apply)
      - requester_pays              = false -> null
      ~ self_link                   = "https://www.googleapis.com/storage/v1/b/dtc_data_lake_ny-rides-jbjorge" -> (known after apply)
      ~ url                         = "gs://dtc_data_lake_ny-rides-jbjorge" -> (known after apply)
        # (3 unchanged attributes hidden)

      ~ lifecycle_rule {

          - condition {
              - age                        = 30 -> null
              - days_since_custom_time     = 0 -> null
              - days_since_noncurrent_time = 0 -> null
              - matches_prefix             = [] -> null
              - matches_storage_class      = [] -> null
              - matches_suffix             = [] -> null
              - num_newer_versions         = 0 -> null
              - with_state                 = "ANY" -> null
            }
          + condition {
              + age                   = 30
              + matches_prefix        = []
              + matches_storage_class = []
              + matches_suffix        = []
              + with_state            = (known after apply)
            }

            # (1 unchanged block hidden)
        }

      + website {
          + main_page_suffix = (known after apply)
          + not_found_page   = (known after apply)
        }

        # (1 unchanged block hidden)
    }

Plan: 2 to add, 0 to change, 2 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

google_storage_bucket.data-lake-bucket: Destroying... [id=dtc_data_lake_ny-rides-jbjorge]
google_bigquery_dataset.dataset: Destroying... [id=projects/ny-rides-jbjorge/datasets/trips_data_all]
google_bigquery_dataset.dataset: Destruction complete after 0s
google_bigquery_dataset.dataset: Creating...
google_storage_bucket.data-lake-bucket: Destruction complete after 1s
google_storage_bucket.data-lake-bucket: Creating...
google_bigquery_dataset.dataset: Creation complete after 1s [id=projects/ny-rides-jbjorge/datasets/trips_data_all]
google_storage_bucket.data-lake-bucket: Still creating... [10s elapsed]
google_storage_bucket.data-lake-bucket: Still creating... [20s elapsed]
google_storage_bucket.data-lake-bucket: Still creating... [30s elapsed]
google_storage_bucket.data-lake-bucket: Still creating... [40s elapsed]
google_storage_bucket.data-lake-bucket: Still creating... [50s elapsed]
google_storage_bucket.data-lake-bucket: Still creating... [1m0s elapsed]
google_storage_bucket.data-lake-bucket: Still creating... [1m10s elapsed]
google_storage_bucket.data-lake-bucket: Still creating... [1m20s elapsed]
google_storage_bucket.data-lake-bucket: Still creating... [1m30s elapsed]
google_storage_bucket.data-lake-bucket: Still creating... [1m40s elapsed]
google_storage_bucket.data-lake-bucket: Still creating... [1m50s elapsed]
google_storage_bucket.data-lake-bucket: Still creating... [2m0s elapsed]
google_storage_bucket.data-lake-bucket: Still creating... [2m10s elapsed]
google_storage_bucket.data-lake-bucket: Still creating... [2m20s elapsed]
google_storage_bucket.data-lake-bucket: Still creating... [2m30s elapsed]
google_storage_bucket.data-lake-bucket: Creation complete after 2m39s [id=dtc_data_lake_ny-rides-jbjorge]

Apply complete! Resources: 2 added, 0 changed, 2 destroyed.
```