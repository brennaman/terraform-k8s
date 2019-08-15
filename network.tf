resource "azurerm_virtual_network" "k8s" {
  name                = "${var.prefix}-network"
  location            = "${azurerm_resource_group.k8s.location}"
  resource_group_name = "${azurerm_resource_group.k8s.name}"
  address_space       = ["10.101.0.0/16"]
}

resource "azurerm_subnet" "k8s" {
  name                 = "internal"
  resource_group_name  = "${azurerm_resource_group.k8s.name}"
  address_prefix       = "10.101.0.0/24"
  virtual_network_name = "${azurerm_virtual_network.k8s.name}"
}