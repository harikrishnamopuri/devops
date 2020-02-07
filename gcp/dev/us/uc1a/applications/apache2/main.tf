module "gke" {
  source                     = "git@github.com:harikrishnamopuri/tf-modules//gcp/resources/gke"
  project_id                 = "axial-radius-249202"
  name                       = "gke-test-hari-krishna"
  region                     = "asia-east1"
  zones                      = ["asia-east1-a", "asia-east1-b", "asia-east1-c"]
  network                    = "vpc-01"
  subnetwork                 = "subnet-01"
  ip_range_pods              = "a"
  ip_range_services          = "b"
  http_load_balancing        = false
  horizontal_pod_autoscaling = true
  network_policy             = true
 # initial_node_count         = 1
  

  node_pools = [
    {
      name               = "default-node-pool"
      machine_type       = "n1-standard-2"
      min_count          = 1
      max_count          = 3
      local_ssd_count    = 0
      disk_size_gb       = 10
      disk_type          = "pd-standard"
      image_type         = "COS"
      auto_repair        = true
      auto_upgrade       = true
      service_account    = "admin-217@axial-radius-249202.iam.gserviceaccount.com"
      preemptible        = false
      initial_node_count = 1
    },
  ]

  node_pools_oauth_scopes = {
    all = []

    default-node-pool = [
      "https://www.googleapis.com/auth/cloud-platform", # gcredstash
      "https://www.googleapis.com/auth/cloudkms",       # gcredstash
      "https://www.googleapis.com/auth/datastore",      # gcredstash
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",

      
    ]
  }

  node_pools_labels = {
    all = {}

    default-node-pool = {
      default-node-pool = true
    }
  }

  node_pools_metadata = {
    all = {}

    default-node-pool = {
      node-pool-metadata-custom-value = "my-node-pool"
    }
  }


  node_pools_tags = {
    all = []

    default-node-pool = [
      "default-node-pool",
    ]
  }
}
