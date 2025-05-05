variable "location" {
  description = "Azure region"
  default     = "UK South"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  default     = "devops-rg"
}

variable "dns_prefix" {
  description = "DNS prefix for AKS cluster"
  default     = "devops-aks"
}

variable "acr_name_suffix" {
  description = "Suffix for ACR name to ensure uniqueness"
  default     = "devoppipe2132"
}
variable "aks_name" {
  description = "Name of the AKS cluster"
  default     = "devops-aks"
}
