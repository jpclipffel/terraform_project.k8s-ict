# code: language=Terraform tabSize=2


resource "vsphere_virtual_machine" "node" {
  # Meta
  count                = var.instances

  # General
  name                 = format(var.name_template, count.index + var.name_seek)
  resource_pool_id     = var.resource_pool_id
  datastore_id         = var.datastore_id
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
    network_id = var.network_server_id
  }

  # Secondary network interface (client network / IPs pool)
  network_interface {
    network_id = var.network_client_id
  }

  # System disk
  disk {
    label            = var.disk_system_label
    size             = var.disk_system_size
    thin_provisioned = false
    eagerly_scrub    = false
  }

  # Cloud-init cdrom
  cdrom {
    client_device = true
  }

  # Cloud-init configuration
  vapp {
    properties ={
      hostname = format(var.name_template, count.index + var.name_seek)
      user-data = base64encode(
        templatefile(
          "${path.module}/templates/cinit.yaml", {
            hostname           = format(var.name_template, count.index + var.name_seek)
            network_server_ips = var.network_server_ips,
            network_client_ips = var.network_client_ips
          }
        )
      )
    }
  }

  lifecycle {
    ignore_changes = [disk]
  }

}
