variable "GOOGLE_PROJECT" {
  type        = string
  description = "GCP project name"
}

variable "GOOGLE_REGION" {
  type        = string
  description = "GCP region name"
}

variable "GKE_NUM_NODES" {
  type        = number
  description = "number of nodes in GKE"
}
