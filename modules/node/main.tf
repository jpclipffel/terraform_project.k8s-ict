# code: language=Terraform tabSize=2


resource "vsphere_virtual_machine" "node" {
  count                = var.instances

  name                 = format(var.name_template, count.index + 1)
  resource_pool_id     = var.resource_pool_id
  datastore_cluster_id = var.datastore_cluster_id
  folder               = var.vm_folder
  num_cpus             = var.num_cpus
  num_cores_per_socket = var.num_cpus
  memory               = var.memory
  guest_id             = var.guest_id

  # Virtual machine template
  clone {
    template_uuid = var.template_uuid
  }

  # Primary network interface (server network / management)
  network_interface {
    network_id = var.network_id_server
  }

  # Secondary network interface (client network / IPs pool)
  network_interface {
    network_id = var.network_id_client
  }

  # System disk
  disk {
    label = var.disk_system_label
    size  = var.disk_system_size
  }

  # Cloud-init cdrom
  cdrom {
    client_device = true
  }

  # Cloud-init configuration
  vapp {
    properties ={
      hostname = format(var.name_template, count.index + 1)
      user-data = base64encode(templatefile("${path.module}/templates/cinit.yaml", { instance = count.index + 1 }))
    }
  }
}
