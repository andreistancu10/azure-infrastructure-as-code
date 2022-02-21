#Variables

variable "business_unit" {
  description = "environment"
  type = string
  default = "dev"
  
}

variable "resource_group" {
  description = "resource_group_name"
  type        = string
  default = "__resource_group_name__"
}


variable "default_location" {
  type        = string
  description = "Locatie setata pentru toate resursele"
  default     = "west europe"
    validation {
    #condition = var.default_location == "west europe"
    condition = contains(["west europe"], var.default_location)
    error_message = "Este permisa crearea de resurse doar in locatia West Europe."
  }
}

variable "secondary_location" {
  type =string
  description = "Locatie secundara"
  default = "northeurope"
}

variable "vnet_name" {
  type    = string
  default = "vnet1"
}

variable "vnet_address_space" {
  description = "Virtual network address space"
  type        = list(string)
  default     = ["192.168.48.0/22", "192.168.56.0/22"]

}

variable "subnet_name" {
  description = "Subnet name"
  type        = string
  default     = "subnet1"
}

variable "default_tags" {
  description = "Default tags"
  type        = map(string)
  default = {
    owner = "andrei"
    type  = "project-dev"
  }
}
  variable "db_name" {
    description = "Mysql database name"
    type = string
    default = "mysqlfirstdb01"
  }
  variable "db_username" {
    type = string
    default = "__username__"

  }
  variable "db_password" {
    type = string
    default = "__password__"
  }

  variable "db_storage"{
    description = "Mysql database storage in MB"
    type = number
    default = 5120
  }
####  OBJECT & TUPLE STRUCTURAL TYPE
/*variable "threat_detection_policy" {
  description = "Azure MySQL DB threat detection policy"
  type = object ({
    enabled = bool
    retention_days = number
    email_account_admins = bool
    email_addresses = list (string) 
  })
}*/

variable "default_nsg"{
  description = "General network security group"
  type = string
  default = "nsg"

}

variable "ip_ita" {
  description = "Firewall acces from ITA"
  type = list(string)
  default =  ["91.237.248.186/32", "91.237.248.1/32", "91.237.248.254/32"]
}

variable "linux_vm" {
  description = "Name of the linux vm"
  type = string
  default = "__virtual_machine_name__"
}