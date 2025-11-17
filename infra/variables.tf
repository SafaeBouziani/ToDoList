variable "resource_group_name" {
  type    = string
  default = "aks-rg-teamX"
}

variable "location" {
  type    = string
  default = "francecentral"
}

variable "cluster_name" {
  type    = string
  default = "aks-team4"
}

variable "node_count" {
  type    = number
  default = 1
}

variable "node_size" {
  type    = string
  default = "Standard_B2s"
}

variable "letsencrypt_email" {
  type    = string
  default = "labrikijihane@gmail.com" # <-- REPLACE with your email before prod
}
