# code: language=Terraform tabSize=2


variable "vsphere_server" {
  type    = string
  default = "iaas-001-vcs01.vcloud"
}

variable "vsphere_user" {
  type = string
}

variable "vsphere_password" {
  type      = string
  sensitive = true
}

variable "vsphere_datacenter" {
  type    = string
  default = "iaas-001-datacenter"
}
