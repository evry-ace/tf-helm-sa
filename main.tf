locals {
  annotations = {
    Created-On   = "${timestamp()}"
    Created-With = "Terraform"
    Created-By   = "${var.owner}"
  }
}

resource "kubernetes_service_account" "tf_helm_sa" {
  metadata {
    name        = "${var.tf_helm_sa_name}"
    namespace   = "${var.tf_helm_sa_namespace}"
    annotations = "${local.annotations}"
  }
}

resource "kubernetes_cluster_role_binding" "tf_helm_sa" {
  depends_on = ["kubernetes_service_account.tf_helm_sa"]

  metadata {
    name        = "tiller"
    annotations = "${local.annotations}"
  }

  subject {
    kind      = "User"
    name      = "system:serviceaccount:kube-system:tiller"
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind      = "Group"
    name      = "system:masters"
    api_group = "rbac.authorization.k8s.io"
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "cluster-admin"
  }
}
