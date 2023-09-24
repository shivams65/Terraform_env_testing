module "resource_group" {
  source = "../Terraform_module/resourcegroup"
  rg     = var.rg
}

module "storage_account" {
  source     = "../Terraform_module/Storage_account"
  sa         = var.sa
  depends_on = [module.resource_group]
}
module "Virtual_network" {
  source     = "../Terraform_module/Virtualnetwork"
  vnet       = var.vnet
  depends_on = [module.storage_account]
}
module "Subnet" {
  source     = "../Terraform_module/subnet"
  subnet     = var.subnet
  depends_on = [module.Virtual_network]
}

module "Vnet_peering" {
  source     = "../Terraform_module/Vnet_peering"
  peering    = var.peering
  depends_on = [module.Subnet]
}

module "keyvault" {
  source     = "../terraform_module/keyvault"
  key_vault  = var.key_vault
  depends_on = [module.Vnet_peering]
}

module "Linux_VM" {
  source     = "../Terraform_module/Linux_VM"
  linuxvm    = var.linuxvm
  depends_on = [module.keyvault]
}

module "Windows_VM" {
  source     = "../Terraform_module/Window_VM"
  windowsvm  = var.windowsvm
  depends_on = [module.Linux_VM]
}

module "Publicip" {
  source     = "../Terraform_module/Public_IP"
  public_ip  = var.public_ip
  depends_on = [module.Subnet]
}

module "Bastion" {
  source     = "../Terraform_module/bastion"
  bastion    = var.bastion
  depends_on = [module.Publicip]
}

module "loadbalancer" {
  source     = "../Terraform_module/loadbalancer"
  vm         = var.vm
  depends_on = [module.Bastion]
}

module "App_services" {
  source     = "../terraform_module/app_services"
  webapp     = var.webapp
  depends_on = [module.Bastion]
}

module "Database" {
  source     = "../terraform_module/database"
  database   = var.database
  depends_on = [module.App_services]
}