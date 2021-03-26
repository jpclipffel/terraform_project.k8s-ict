# code: language=Terraform tabSize=2


# Default datacenter
data "vsphere_datacenter" "default" {
  name = var.vsphere_datacenter
}

# Default datastore
data "vsphere_datastore_cluster" "default" {
  name          = "DATI : ICT"
  datacenter_id = data.vsphere_datacenter.default.id
}

# Gare resource pool (low)
data "vsphere_resource_pool" "gare_low" {
  name          = "g.lo : DATI : ICT"
  datacenter_id = data.vsphere_datacenter.default.id
}

# Kirchberg resource pool (low)
data "vsphere_resource_pool" "kirchberg_low" {
  name          = "k.lo : DATI : ICT"
  datacenter_id = data.vsphere_datacenter.default.id
}

# DevOps network
data "vsphere_network" "devops" {
  name          = "3027:ICT:DevOps"
  datacenter_id = data.vsphere_datacenter.default.id
}

# K8S server network
data "vsphere_network" "k8s_servers" {
  name          = "3019:ICT:K8S-Servers"
  datacenter_id = data.vsphere_datacenter.default.id
}

# # K8S client network
# data "vsphere_network" "k8s_client" {
#   name          = "3019:ICT:K8S-client"
#   datacenter_id = data.vsphere_datacenter.default.id
# }

# Virtual machine template
data "vsphere_virtual_machine" "template" {
  name          = "ubuntu-focal-20.04-cloudimg"
  datacenter_id = data.vsphere_datacenter.default.id
}
