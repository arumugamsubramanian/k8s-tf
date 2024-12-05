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

terraform_version_constraint = "~> 1.5"

terraform {
  before_hook "info" {
    commands = ["apply", "plan", "import", "push", "refresh"]
    execute = ["sh", "-c", "pwd"]
  }
}
