variable "rgName" {
  type        = string
  description = "Nombre Grupo de recursos"
  default     = "rg-devops"
}
variable "rgLocation" {
  type        = string
  description = "Ubicacion de Grupo de recursos"
  default     = "eastus2"
}

# variable "aksadminID" {
#   type = list
#   description = "ID aks admin group"
# }

# variable "SubNetAKSPool" { 
#   type        = string
#   description = "Subnet de AKS"
# }

# variable "VNetName" {
#   type        = string
#   description = "Subnet de AKS"
# }