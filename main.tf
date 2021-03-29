# code: language=Terraform tabSize=2


module "masters-kirchberg" {
  source               = "./modules/node"
  instances            = 2
  seek                 = 1
  name_template        = "k8s-ict-master-%02d"
  resource_pool_id     = data.vsphere_resource_pool.kirchberg_low.id
  # datastore_cluster_id = data.vsphere_datastore_cluster.default.id
  datastore_id         = data.vsphere_datastore.kirchberg_01.id
  vm_folder            = "_root/DATI : ICT/K8S/k8s-ict-prod"
  num_cpus             = 8
  memory               = 8192
  guest_id             = data.vsphere_virtual_machine.template.guest_id
  template_uuid        = data.vsphere_virtual_machine.template.id
  network_id_server    = data.vsphere_network.k8s_servers.id
  network_id_client    = data.vsphere_network.k8s_servers.id
  disk_system_label    = "disk0"
  disk_system_size     = 64
}

module "masters-gare" {
  source               = "./modules/node"
  instances            = 1
  seek                 = 3
  name_template        = "k8s-ict-master-%02d"
  resource_pool_id     = data.vsphere_resource_pool.gare_low.id
  # datastore_cluster_id = data.vsphere_datastore_cluster.default.id
  datastore_id         = data.vsphere_datastore.gare_02.id
  vm_folder            = "_root/DATI : ICT/K8S/k8s-ict-prod"
  num_cpus             = 8
  memory               = 8192
  guest_id             = data.vsphere_virtual_machine.template.guest_id
  template_uuid        = data.vsphere_virtual_machine.template.id
  network_id_server    = data.vsphere_network.k8s_servers.id
  network_id_client    = data.vsphere_network.k8s_servers.id
  disk_system_label    = "disk0"
  disk_system_size     = 64
}

# module "workers" {
#   source               = "./modules/node"
#   instances            = 0
#   name_template        = "k8s-ict-worker-%02d"
#   resource_pool_id     = data.vsphere_resource_pool.gare_low.id
#   # datastore_cluster_id = data.vsphere_datastore_cluster.default.id
#   datastore_id         = data.vsphere_datastore.kirchberg.id
#   vm_folder            = "_root/DATI : ICT/K8S/k8s-ict-prod"
#   num_cpus             = 8
#   memory               = 8192
#   guest_id             = data.vsphere_virtual_machine.template.guest_id
#   template_uuid        = data.vsphere_virtual_machine.template.id
#   network_id_server    = data.vsphere_network.k8s_servers.id
#   network_id_client    = data.vsphere_network.k8s_servers.id
#   disk_system_label    = "disk0"
#   disk_system_size     = 64
# }
