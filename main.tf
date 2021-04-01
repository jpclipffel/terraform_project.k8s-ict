# code: language=Terraform tabSize=2


module "masters-kirchberg" {
  # Meta
  source               = "./modules/node"
  instances            = 2
  name_seek            = 1
  name_template        = var.master_name_template
  # General
  resource_pool_id     = data.vsphere_resource_pool.kirchberg_low.id
  datastore_id         = data.vsphere_datastore.kirchberg_01.id
  vm_folder            = "_root/DATI : ICT/K8S/k8s-ict-prod"
  num_cpus             = 8
  memory               = 8192
  guest_id             = data.vsphere_virtual_machine.template.guest_id
  template_uuid        = data.vsphere_virtual_machine.template.id
  # Network
  network_server_id    = data.vsphere_network.k8s_servers.id
  network_server_ips   = var.network_server_ips
  network_client_id    = data.vsphere_network.k8s_servers.id
  network_client_ips   = var.network_client_ips
  # Disk
  disk_system_label    = "disk0"
  disk_system_size     = 64
}

module "masters-gare" {
  # Meta
  source               = "./modules/node"
  instances            = 1
  name_seek            = 3
  name_template        = var.master_name_template
  # General
  resource_pool_id     = data.vsphere_resource_pool.gare_low.id
  datastore_id         = data.vsphere_datastore.gare_02.id
  vm_folder            = "_root/DATI : ICT/K8S/k8s-ict-prod"
  num_cpus             = 8
  memory               = 8192
  guest_id             = data.vsphere_virtual_machine.template.guest_id
  template_uuid        = data.vsphere_virtual_machine.template.id
  # Network
  network_server_id    = data.vsphere_network.k8s_servers.id
  network_server_ips   = var.network_server_ips
  network_client_id    = data.vsphere_network.k8s_servers.id
  network_client_ips   = var.network_client_ips
  # Disk
  disk_system_label    = "disk0"
  disk_system_size     = 64
}

module "worker-kirchberg" {
  # Meta
  source               = "./modules/node"
  instances            = 3
  name_seek            = 1
  name_template        = var.worker_name_template
  # General
  resource_pool_id     = data.vsphere_resource_pool.kirchberg_low.id
  datastore_id         = data.vsphere_datastore.kirchberg_02.id
  vm_folder            = "_root/DATI : ICT/K8S/k8s-ict-prod"
  num_cpus             = 8
  memory               = 8192
  guest_id             = data.vsphere_virtual_machine.template.guest_id
  template_uuid        = data.vsphere_virtual_machine.template.id
  # Network
  network_server_id    = data.vsphere_network.k8s_servers.id
  network_server_ips   = var.network_server_ips
  network_client_id    = data.vsphere_network.k8s_servers.id
  network_client_ips   = var.network_client_ips
  # Disk
  disk_system_label    = "disk0"
  disk_system_size     = 64
}

module "worker-gare" {
  # Meta
  source               = "./modules/node"
  instances            = 3
  name_seek            = 4
  name_template        = var.worker_name_template
  # General
  resource_pool_id     = data.vsphere_resource_pool.gare_low.id
  datastore_id         = data.vsphere_datastore.gare_02.id
  vm_folder            = "_root/DATI : ICT/K8S/k8s-ict-prod"
  num_cpus             = 8
  memory               = 8192
  guest_id             = data.vsphere_virtual_machine.template.guest_id
  template_uuid        = data.vsphere_virtual_machine.template.id
  # Network
  network_server_id    = data.vsphere_network.k8s_servers.id
  network_server_ips   = var.network_server_ips
  network_client_id    = data.vsphere_network.k8s_servers.id
  network_client_ips   = var.network_client_ips
  # Disk
  disk_system_label    = "disk0"
  disk_system_size     = 64
}
