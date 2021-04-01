# code: language=Terraform tabSize=2

# =============================================================================
# Provisioner - vsphere
# =============================================================================

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

# =============================================================================
# Custom variables
# =============================================================================

variable "master_name_template" {
  description = "The name template for K8S master virtual machines"
  default = "k8s-ict-master-%02d"
}

variable "worker_name_template" {
  description = "The name template for K8S worker virtual machines"
  default = "k8s-ict-worker-%02d"
}

variable "network_server_ips" {
  description = "Static IP addresses on the server (management) network"
  default = {
    # Masters
    "k8s-ict-master-01" = "172.29.42.21/24",
    "k8s-ict-master-02" = "172.29.42.22/24",
    "k8s-ict-master-03" = "172.29.42.23/24",
    # Workers
    "k8s-ict-worker-01" = "172.29.42.31/24",
    "k8s-ict-worker-02" = "172.29.42.32/24",
    "k8s-ict-worker-03" = "172.29.42.33/24",
    "k8s-ict-worker-04" = "172.29.42.34/24",
    "k8s-ict-worker-05" = "172.29.42.35/24",
    "k8s-ict-worker-06" = "172.29.42.36/24",
    # Future scaling
    # "k8s-ict-worker-07" = "172.29.42.37/24",
    # "k8s-ict-worker-08" = "172.29.42.38/24",
    # "k8s-ict-worker-09" = "172.29.42.39/24",
    # "k8s-ict-worker-10" = "172.29.42.40/24",
  }
}

variable "network_client_ips" {
  description = "Static IP addresses on the client (IP pool) network"
  default = {
    # Masters
    "k8s-ict-master-01" = "172.29.43.21/24",
    "k8s-ict-master-02" = "172.29.43.22/24",
    "k8s-ict-master-03" = "172.29.43.23/24",
    # Workers
    "k8s-ict-worker-01" = "172.29.43.31/24",
    "k8s-ict-worker-02" = "172.29.43.32/24",
    "k8s-ict-worker-03" = "172.29.43.33/24",
    "k8s-ict-worker-04" = "172.29.43.34/24",
    "k8s-ict-worker-05" = "172.29.43.35/24",
    "k8s-ict-worker-06" = "172.29.43.36/24",
    # Future scaling
    # "k8s-ict-worker-07" = "172.29.43.37/24",
    # "k8s-ict-worker-08" = "172.29.43.38/24",
    # "k8s-ict-worker-09" = "172.29.43.39/24",
    # "k8s-ict-worker-10" = "172.29.43.40/24",
  }
}
