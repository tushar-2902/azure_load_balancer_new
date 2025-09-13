module "rg" {
  source = "../Modules/resource"
  rg-name = "tushar-rg"
  location = "West Europe"
}

module "vnet" {
  source = "../Modules/vnet"
  depends_on = [ module.rg ]
  vnet-name = "tushar-vnet"
  nsg-name = "tushar-nsg"
  location = "West Europe"
  rg-name = "tushar-rg"
  address-space = ["10.0.0.0/16"]

}

module "sb-1" {
 depends_on = [ module.vnet ]
  source = "../Modules/subnet"
  sb-name = "tushar-sb"
  rg-name = "tushar-rg"
  vnet-name = "tushar-vnet"
  address-prefixes = ["10.0.1.0/24"]
}

module "sb-2" {
  depends_on = [ module.vnet ]
  source = "../Modules/subnet"
  sb-name = "AzureBastionSubnet"
  rg-name = "tushar-rg"
  vnet-name = "tushar-vnet"
  address-prefixes = ["10.0.0.0/26"]
}

module "pip" {
depends_on = [ module.rg ]
  source = "../Modules/public-ip"
  pip-name = "tushar-bas-pip"
  rg-name = "tushar-rg"
  location = "West Europe"
}

module "pip-1" {
depends_on = [ module.rg ]
  source = "../Modules/public-ip"
  pip-name = "tushar-load-pip"
  rg-name = "tushar-rg"
  location = "West Europe"
}

module "bas" {
  depends_on = [ module.pip,module.vnet,module.sb-2 ]
  source = "../Modules/bastion"
  bas-name = "tushar-bas"
  rg-name = "tushar-rg"
  location = "West Europe"
  vnet-name = "tushar-vnet"

}

module "vm-1" {
  depends_on = [ module.vnet,module.sb-1 ]
  source = "../Modules/vm"
  vm-name = "tushar-vm-1"
  nic-name = "tushar-nic-1"
  nsg-name = "tushar-nsg"
  admin-name = "tushar-vm-1"
  admin-password = "tushar@2021"
  location = "West Europe"
  rg-name = "tushar-rg"
  vnet-name = "tushar-vnet"

}

module "vm-2" {
  depends_on = [ module.vnet,module.sb-1 ]
  source = "../Modules/vm"
  vm-name = "tushar-vm-2"
  nic-name = "tushar-nic-2"
  nsg-name = "tushar-nsg"
  admin-name = "tushar-vm-2"
  admin-password = "tushar@2021"
  location = "West Europe"
  rg-name = "tushar-rg"
  vnet-name = "tushar-vnet"

}

module "load" {
  source = "../Modules/loadbalancer"
  depends_on = [ module.pip-1 ]
}

module "vm-1-join" {
  source = "../Modules/load-association"
  depends_on = [ module.vm-1,module.load ]
  nic-name = "tushar-nic-1"
  rg-name = "tushar-rg"
  lb-name = "tushar-lb"
  backend-pool = "BackEndAddressPool"

}

module "vm-2-join" {
  source = "../Modules/load-association"
  depends_on = [ module.vm-2,module.load ]
  nic-name = "tushar-nic-2"
  rg-name = "tushar-rg"
  lb-name = "tushar-lb"
  backend-pool = "BackEndAddressPool"

}


  


