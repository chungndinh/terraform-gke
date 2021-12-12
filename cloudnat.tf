module "cloud-nat" {
  source     = "terraform-google-modules/cloud-nat/google"
  version    = "~> 1.2"
  project_id = "divine-display-330317"
  region     = "asia-southeast2"
  name       = "demo-terraform-cloutnat-1"
  router     = "demo-terraform-router-1"
  create_router = true
  network    = "demo-terraform-vpc-1"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  depends_on = [ module.gke ]
}