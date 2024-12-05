terraform {
  source = "../../../tf-modules/kind/cluster_charts_00"
}

inputs = {
  kubeconfig_path = "${get_env("KUBECONFIG", "~/.kube/config")}"
  namespace_name  = "dev"
}