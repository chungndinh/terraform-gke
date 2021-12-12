module "gke" {
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  project_id                 = "divine-display-330317"
  name                       = "demo-terraform"
  region                     = "asia-southeast2"
  regional                   = false
  zones                      = ["asia-southeast2-a"]
  network                    = "demo-terraform-vpc-1"
  subnetwork                 = "demo-terraform-subnet-1"
  ip_range_pods              = "pods-address"
  ip_range_services          = "services-address"
  default_max_pods_per_node  = 32
  http_load_balancing        = false
  horizontal_pod_autoscaling = true
  network_policy             = false
  enable_private_endpoint    = false
  enable_private_nodes       = true
  master_ipv4_cidr_block     = "172.16.7.0/28"

  node_pools = [
    {
      name                      = "demo-terraform-nodepools-1"
      machine_type              = "e2-medium"
      node_locations            = ""
      min_count                 = 1
      max_count                 = 60
      local_ssd_count           = 0
      disk_size_gb              = 20
      disk_type                 = "pd-standard"
      image_type                = "COS"
      auto_repair               = true
      auto_upgrade              = true
      preemptible               = false
      initial_node_count        = 2
      service_account           = "terraform@divine-display-330317.iam.gserviceaccount.com"
    },
  ]

  node_pools_oauth_scopes = {
    all = []

    demo-terraform-nodepools-1 = [
      "https://www.googleapis.com/auth/cloud-platform",
    ]
  }

  node_pools_labels = {
    all = {}
  }

  node_pools_metadata = {
    all = {}
  }

  node_pools_taints = {
    all = []
  }

  node_pools_tags = {
    all = []
  }

  depends_on = [ module.subnet ]
}