variable "owner" {
  default     = ""
}
variable "tf_helm_sa_name" {
  description = "Tiller service account name"
  default     = "tiller"
}

variable "tf_helm_sa_namespace" {
  description = "Tiller service account namespace"
  default     = "kube-system"
}