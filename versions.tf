# code: language=Terraform tabSize=2


terraform {
  required_version = ">= 0.14"

  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = ">= 1.25.0"
    }
  }
}
