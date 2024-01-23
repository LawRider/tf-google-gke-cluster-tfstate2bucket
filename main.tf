provider "google" {
  project = var.GOOGLE_PROJECT
  region  = var.GOOGLE_REGION
}

module "gke_cluster" {
  source         = "github.com/LawRider/tf-google-gke-cluster"
  GOOGLE_REGION  = var.GOOGLE_REGION
  GOOGLE_PROJECT = var.GOOGLE_PROJECT
  GKE_NUM_NODES  = var.GKE_NUM_NODES
}

resource "google_container_cluster" "my_cluster" {
  name     = "my-gke-cluster"
  location = var.GOOGLE_REGION

  node_pool {
    name       = "default-pool"
    node_count = var.GKE_NUM_NODES
    # Інші налаштування вузлів
  }
}

terraform {
  backend "gcs" {
    bucket = "do_course_test_bucket"
    prefix = "terraform/state"
  }
}
