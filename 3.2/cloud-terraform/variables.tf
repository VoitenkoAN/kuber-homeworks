###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

variable "subnet_cidr_blocks" {
  description = "CIDR blocks for subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "svc_account_id" {
  default = "aje3l1um0ompu2tbdh19"
}

variable "spcontrolnode" {
  type = number
  default = 1
}

variable "spworknode_group" {
  type = number
  default = 2
}

variable "vm_name" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "name system"
}

variable "vm_metadata" {
  type = map(any)
  default = {
    "serial-port-enable" = 1
  }
  description = "vm_metadata"
}

/////////////////////////////////
/////////ControlNode/////////////
/////////////////////////////////

variable "vm_controlnode_instance_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform ID"
}

variable "vm_controlnode_resources" {
  type = map(any)
  default = {
    "cores"         = 2
    "memory"        = 2
    "core_fraction" = 5
    "size"          = 50
  }
  description = "ControlNode"
}

variable "vm_controlnode_instance_scheduling_policy" {
  type        = bool
  default     = true
  description = "Scheduling policy"
}

variable "vm_controlnode_instance_network_interface_nat" {
  type        = bool
  default     = true
  description = "Interface NAT"
}

/////////////////////////////////
/////////WorkNode/////////////
/////////////////////////////////

variable "vm_worknode_instance_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "Platform ID"
}

variable "vm_worknode_resources" {
  type = map(any)
  default = {
    "cores"         = 2
    "memory"        = 2
    "core_fraction" = 5
    "size"          = 50
  }
  description = "worknode"
}

variable "vm_worknode_instance_scheduling_policy" {
  type        = bool
  default     = true
  description = "Scheduling policy"
}

variable "vm_worknode_instance_network_interface_nat" {
  type        = bool
  default     = true
  description = "Interface NAT"
}

# ///////////////////////////////////
# ///////////vpc network/////////////
# ///////////////////////////////////

variable "domain" {
  default = "netology"
}

variable "public-vm-name" {
  default = "public-vm1"
}
