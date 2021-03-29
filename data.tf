# code: language=Terraform tabSize=2


# Default datacenter
data "vsphere_datacenter" "default" {
  name = var.vsphere_datacenter
}

# Default datastore cluster
data "vsphere_datastore_cluster" "default" {
  name          = "DATI : ICT"
  datacenter_id = data.vsphere_datacenter.default.id
}

# Kirchberg datastore 01
data "vsphere_datastore" "kirchberg_01" {
  name          = "iaas-001-ict-klp-ds01"
  datacenter_id = data.vsphere_datacenter.default.id
}

# Kirchberg datastore 02
data "vsphere_datastore" "kirchberg_02" {
  name          = "iaas-001-ict-klp-ds02"
  datacenter_id = data.vsphere_datacenter.default.id
}

# Kirchberg datastore 03
data "vsphere_datastore" "kirchberg_03" {
  name          = "iaas-001-ict-klp-ds03"
  datacenter_id = data.vsphere_datacenter.default.id
}

# Gare datastore 01
data "vsphere_datastore" "gare_01" {
  name          = "iaas-001-ict-glp-ds01"
  datacenter_id = data.vsphere_datacenter.default.id
}

# Gare datastore 02
data "vsphere_datastore" "gare_02" {
  name          = "iaas-001-ict-glp-ds02"
  datacenter_id = data.vsphere_datacenter.default.id
}

# Gare datastore 03
data "vsphere_datastore" "gare_03" {
  name          = "iaas-001-ict-glp-ds03"
  datacenter_id = data.vsphere_datacenter.default.id
}

# Gare datastore 04
data "vsphere_datastore" "gare_04" {
  name          = "iaas-001-ict-glp-ds04"
  datacenter_id = data.vsphere_datacenter.default.id
}

# Gare datastore 05
data "vsphere_datastore" "gare_05" {
  name          = "iaas-001-ict-glp-ds05"
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
