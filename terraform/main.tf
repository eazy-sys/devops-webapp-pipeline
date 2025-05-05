module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "acr" {
  source              = "./modules/acr"
  acr_name_suffix     = var.acr_name_suffix
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
}

module "aks" {
  source              = "./modules/aks"
  aks_name            = var.aks_name
  dns_prefix          = var.dns_prefix
  resource_group_name = module.resource_group.resource_group_name
  location            = var.location
}