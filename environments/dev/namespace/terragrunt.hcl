include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../../../../tf-modules/kind/cluster_charts_00"
  # source = "git::https://github.com/arumugamsubramanian/tf-modules.git//kind/cluster_charts_00?ref=main"
}

inputs = {
  kubeconfig_path = "${get_env("KUBECONFIG", "~/.kube/config")}"
  namespace_name  = "dev2"
}