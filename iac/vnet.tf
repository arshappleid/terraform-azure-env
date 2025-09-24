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
resource "azurerm_network_security_rule" "allow_ssh" {
  name                        = "Allow-SSH"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  network_security_group_name = azurerm_network_security_group.my_nsg.name
  resource_group_name         = azurerm_resource_group.my_rg.name
}
