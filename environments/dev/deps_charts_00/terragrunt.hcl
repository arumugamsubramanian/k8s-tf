include "root" {
  path = find_in_parent_folders()
}

locals {
  env_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

#######################################################################################################################

terraform {
  source = "../../../../tf-modules//shared/deps_charts_00"
  # source = "git::https://github.com/arumugamsubramanian/tf-modules.git//shared/deps_charts_00?ref=main"
}

inputs = {
  environment     = local.env_vars.locals.environment
  kubeconfig_path = "${get_env("KUBECONFIG", "~/.kube/config")}"
  namespace_name  = "dev"
  vault = { enabled = true, values = { version = "0.22.1" } }

  sealed_secrets = { enabled = true, values = {} }

  root_ca_tls_config = { enabled = true, values = {} }

  cert_manager_controller = { enabled = true, values = {} }

  kind_ingress_nginx = { enabled = true, values = {} }
}
