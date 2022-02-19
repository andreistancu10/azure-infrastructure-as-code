#Vnet

resource "azurerm_virtual_network" "vnet"{
    depends_on = [
      azurerm_resource_group.resource_group
    ]
    resource_group_name = var.resource_group
    location = var.default_location
    name = "${var.business_unit}-${var.vnet_name}"
    address_space = var.vnet_address_space
    
    tags = var.default_tags
    
}
#Subnet
resource "azurerm_subnet" "subnet01" {
    depends_on = [
      azurerm_resource_group.resource_group,
      azurerm_virtual_network.vnet
    ]
    name = "${var.business_unit}-${var.subnet_name}"
    resource_group_name = var.resource_group
    virtual_network_name = "${var.business_unit}-${var.vnet_name}"
    address_prefixes = ["192.168.49.0/24"]
    


}

#NIC

resource "azurerm_network_interface" "nic01" {
    depends_on = [
      azurerm_resource_group.resource_group
    ]
    resource_group_name = var.resource_group
    location = var.default_location
    name = "mynic-${random_string.myrandomstring.id}"

    tags = var.default_tags
    

    ip_configuration {
      name = "internal"
      subnet_id = azurerm_subnet.subnet01.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.publicip01.id
    }

  
}
#Public IP

resource "azurerm_public_ip" "publicip01" {
    depends_on = [
      azurerm_resource_group.resource_group
    ]
    name = "publicip-${random_string.myrandomstring.id}"
    resource_group_name = var.resource_group
    location = var.default_location
    allocation_method = "Dynamic"
    tags = var.default_tags

    
  
}

#NSG 

resource "azurerm_network_security_group" "nsg01" {
    depends_on = [
      azurerm_resource_group.resource_group
    ]
  name = "${var.business_unit}-${var.default_nsg}"
  location = var.default_location
  resource_group_name = var.resource_group
  tags = var.default_tags
  

  security_rule{
      name = "Allow SSH from ITA"
      priority = 400
      direction = "inbound"
      access = "allow"
      protocol = "tcp"
      source_port_range = "*"
      destination_port_range = 22
      source_address_prefixes = var.ip_ita
      destination_address_prefix = "*"

    }
}

resource "azurerm_subnet_network_security_group_association" "nsg_association" {
    network_security_group_id = azurerm_network_security_group.nsg01.id
    subnet_id = azurerm_subnet.subnet01.id
    #network_interface_id =azurerm_network_interface.id
  
}
