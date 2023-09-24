# Global Variable

variable "location" {
  type = string
}

variable "rg_name" {
  type = string
}

# RG Variable

variable "rg" {
  type = map(any)
}

# Virtual Network

variable "vnet" {
  type = map(any)
}

# Storage Account

variable "sa" {
  type = map(any)
}

# Subnet

variable "subnet" {
  type = map(any)
}

# Vnet Peering

variable "peering" {
  type = map(any)
}

# Keyvault

variable "key_vault" {
  type = map(any)
}

# Linux VM

variable "linuxvm" {
  type = map(any)
}

# Windows VM

variable "windowsvm" {
  type = map(any)
}

# Bastion

variable "bastion" {
  type = map(any)
}

# App Services

variable "webapp" {
  type = map(any)
}


# Database

variable "database" {
  type = map(any)
}



# public IP

variable "public_ip" {
  type = map(any)
}

#Load Balancer

variable "vm" {
  type = map(any)
}