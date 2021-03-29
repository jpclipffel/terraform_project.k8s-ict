# code: language=Terraform tabSize=2

# =============================================================================
# Meta
# =============================================================================

variable "instances" {
  description = "Number or instances (the 'count' meta-argument)"
  type        = number
  default     = 1
}

variable "name_seek" {
  description = "Increment name when using count (count + name_seek)"
  type        = number
  default     = 0
}

# =============================================================================
# General
# =============================================================================

variable "name_template" {
  description = "Instance name template"
  type        = string
  default     = "ict-k8s-node-%02d"
}

variable "resource_pool_id" {
  description = "The resource pool ID"
  type        = string
}

# variable "datastore_cluster_id" {
#   description = "The datastore cluster ID"
#   type        = string
# }

variable "datastore_id" {
  description = "The datastore ID"
  type        = string
}

variable "vm_folder" {
  description = "The VM folder path relative to the datacenter"
  type        = string
}

variable "num_cpus" {
  description = "The number of CPU and CPU core per socket"
  type        = number
}

variable "memory" {
  description = "The amount of memory in MB"
  type        = number
}

variable "guest_id" {
  description = "The guest VM ID, usually the VM (or VM template) guest ID"
  type        = string
}

variable "template_uuid" {
  description = "The UUID of the VM (or VM template) to clone"
  type        = string
}

# =============================================================================
# Networks
# =============================================================================

variable "network_server_id" {
  description = "The ID of the server (management) network"
}

variable "network_server_ips" {
  description = "Static IP addresses on the server (management) network"
}

variable "network_client_id" {
  description = "The ID of the client (IP pool) network"
}

variable "network_client_ips" {
  description = "Static IP addresses on the client (IP pool) network"
}

# =============================================================================
# Disk
# =============================================================================


variable "disk_system_label" {
  description = "The system disk name (label)"
  type        = string
  default     = "disk0"
}

variable "disk_system_size" {
  description = "The system disk dize in GB"
  type        = number
  default     = 126
}
