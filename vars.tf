variable "worker_count" {
  default = 1
}

variable "worker_max_count" {
  default = 5
}

variable "worker_size" {
  default = "s-2vcpu-2gb"
}

variable "write_kubeconfig" {
  type    = bool
  default = true
}

