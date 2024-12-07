include "root" {
  path = find_in_parent_folders()
}

locals {
  env_vars    = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

#######################################################################################################################

dependencies {
  paths = [
    "../deps_charts_00",
  ]
}

#######################################################################################################################

terraform {
  source = "../../../../tf-modules//shared/base_deps_provision"
  # source = "git::https://github.com/arumugamsubramanian/tf-modules.git//shared/base_deps_provision?ref=main"
}

inputs = {
  kubeconfig_path = "${get_env("KUBECONFIG", "~/.kube/config")}"
  environment         = local.env_vars.locals.environment
  namespace_name  = "base"
}
