module "avm-res-network-virtualnetwork" {
  source = "Azure/avm-res-network-virtualnetwork/azurerm"

  address_space       = ["192.168.0.0/24"]
  location            = "East US 2"
  name                = "myVNet"
  resource_group_name = azurerm_resource_group.rg.name
  subnets = {
    "subnet1" = {
      name             = "subnet1"
      address_prefixes = ["192.168.0.0/25"]
    }
    "subnet2" = {
      name             = "subnet2"
      address_prefixes = ["192.168.0.128/25"]
    }
  }
}
