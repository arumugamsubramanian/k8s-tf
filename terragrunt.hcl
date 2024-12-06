generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<-EOF
  terraform {
    required_version = "~> 1.5"
    required_providers {
      kubernetes = {
        source = "hashicorp/kubernetes"
        version = "2.33.0"
      }
      helm = {
        source = "hashicorp/helm"
        version = "2.16.0"
      }
      random = {
        source = "hashicorp/random"
        version = "3.6.2"
      }
    }
  }
  EOF
}

locals {
  environment = basename(dirname(path_relative_to_include()))
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
  terraform {
    backend "local" {
     path = "../../../../../../../../../state_files/${local.environment}/terraform.tfstate"
    }
  }
  EOF
}

terraform_version_constraint = "~> 1.5"

terraform {
  before_hook "info" {
    commands = ["apply", "plan", "import", "push", "refresh"]
    execute = ["sh", "-c", "pwd"]
  }

  # extra_arguments "retry_lock" {
  #   commands = [
  #     "init",
  #     "apply",
  #     "refresh",
  #     "import",
  #     "plan",
  #     "taint",
  #     "untaint"
  #   ]
  #
  #   arguments = [
  #     "-lock-timeout=20m"
  #   ]
  # }
  #
  # extra_arguments "init_arg" {
  #   commands = [
  #     "init"
  #   ]
  #
  #   arguments = [
  #     "-plugin-dir=/my/tofu/plugin/dir",
  #   ]
  # }
}
