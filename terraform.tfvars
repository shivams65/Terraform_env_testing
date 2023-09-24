# Global Declare
location = "east us"
rg_name  = "shivam-rg"

#Resouce Group

rg = {
  "rg1" = {
    name     = "shivam-rg"
    location = "east us"
  }
}

#Storage Account

sa = {
  "storageaccount1" = {
    name                     = "shivamsa01"
    location                 = "east us"
    resource_group_name      = "shivam-rg"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    container_name           = "tfstate"
    container_access_type    = "private"
  }
}

#Virtual Network 

vnet = {
  "Vnet1" = {
    name                = "Virtual_network_1"
    location            = "east us"
    resource_group_name = "shivam-rg"
    address_space       = ["10.0.0.0/16"]
  },
  "Vnet2" = {
    name                = "Virtual_network_2"
    location            = "east us"
    resource_group_name = "shivam-rg"
    address_space       = ["20.0.0.0/16"]
  },
}

#Subnet

subnet = {
  "subnet1" = {
    name                 = "Shivam-Vnet1-subnet"
    virtual_network_name = "Virtual_network_1"
    resource_group_name  = "shivam-rg"
    address_prefixes     = ["10.0.1.0/24"]
  },
  "subnet2" = {
    name                 = "Shivam-Vnet2-subnet"
    virtual_network_name = "Virtual_network_2"
    resource_group_name  = "shivam-rg"
    address_prefixes     = ["20.0.1.0/24"]
  },
  "subnet3" = {
    name                 = "AzureBastionSubnet"
    virtual_network_name = "Virtual_network_1"
    resource_group_name  = "shivam-rg"
    address_prefixes     = ["10.0.5.0/24"]
  }
}

# Peering

peering = {
  "Peering1" = {
    "vnet_name"            = "Virtual_network_1"
    "name"                 = "peer1to2"
    "virtual_network_name" = "Virtual_network_2"
    resource_group_name    = "shivam-rg"
  },
  "Peering2" = {
    "vnet_name"            = "Virtual_network_2"
    "name"                 = "peer2to1"
    resource_group_name    = "shivam-rg"
    "virtual_network_name" = "Virtual_network_1"
  }
}

# Keyvault

key_vault = {
  "Keyvault1" = {
    name                = "VM-Login"
    resource_group_name = "shivam-rg"
    location            = "east us"
  }
}

# Linux VM

linuxvm = {
  linuxvm01 = {
    subnetname           = "Shivam-Vnet1-subnet"
    nicname              = "vmnic01"
    resource_group_name  = "shivam-rg"
    location             = "east us"
    vmname               = "linuxvm01"
    virtual_network_name = "Virtual_network_1"
  }
}

# Windows VM

windowsvm = {
  "windowsvm1" = {
    nic_name             = "windowsvm01-nic"
    name                 = "windowsvm01"
    resource_group_name  = "shivam-rg"
    location             = "east us"
    virtual_network_name = "Virtual_network_2"
    subnetname           = "Shivam-Vnet2-subnet"
  }
}

# Bastion

bastion = {
  "bastion01" = {
    name                  = "shivam_bastion_01"
    ip_configuration_name = "configuration"
    resource_group_name   = "shivam-rg"
    location              = "east us"
  }
}

# App Services

webapp = {
  "Webapp1" = {
    appserviceplanname  = "Shivam-Appserviceplan"
    web_app_name        = "Shivam-webappname01"
    resource_group_name = "shivam-rg"
    location            = "east us"
  }
}


# Database

database = {
  "database01" = {
    sqlserver_name               = "shivam-sqlserver"
    version                      = "12.0"
    administrator_login          = "sqladminstrator"
    administrator_login_password = "Thisisadog11"
    minimum_tls_version          = "1.2"
    database_name                = "shivam-sqldatabase"
    resource_group_name          = "shivam-rg"
    location                     = "east us"
  }
}

#Publicip

public_ip = {
  "public_ip_01" = {
    name                = "shivampublicip01"
    location            = "east us"
    resource_group_name = "shivam-rg"
  },
  "public_ip_02" = {
    name                = "PublicIPForLB"
    location            = "east us"
    resource_group_name = "shivam-rg"
  }
}

# Loadbalancer

vm = {
  "vm1" = {
    "name"                    = "linuxvm01"
    "backendaddresspool_name" = "linuxvm01"
    resource_group_name       = "shivam-rg"
    location                  = "east us"
  },
  "vm2" = {
    "name"                    = "windowsvm01"
    "backendaddresspool_name" = "windowsvm01"
    resource_group_name       = "shivam-rg"
    location                  = "east us"
  }
}