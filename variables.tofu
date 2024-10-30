variable "workload" { type = string }
variable "environment" { type = string }
variable "product" { type = string }
variable "storage_accounts" { type = bool }
variable "region_short" {
  type    = string
  default = "euw"
}

locals {
  resource_group_name = "rg-${var.product}-${var.region_short}-${var.workload}"
  storage_accounts = var.storage_accounts ? {
    devops = {
      dev_sa1 = {
        name = join("", ["st", var.product, "dev"])
      }
      dev_sa2 = {
        name = join("", ["st", var.product, "dev1"])
      }
      dev_sa3 = {
        name = join("", ["st", var.product, "dev2"])
      }
    }
    qa = {
      qa_sa1 = {
        name = join("", ["st", var.product, "qa"])
      }
    }
    staging = {
      staging_sa1 = {
        name = join("", ["st", var.product, "staging"])
      }
    }
  }[var.environment] : {}
}
