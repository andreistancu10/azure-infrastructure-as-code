#linux virtual machine

resource "azurerm_linux_virtual_machine" "linux_vm" {
    depends_on = [
        azurerm_resource_group.resource_group
    ]
    name = var.linux_vm
    computer_name = var.linux_vm
    resource_group_name = var.resource_group
    location = var.default_location
    #az vm list-sizes -l westeurope -o table
    size = "Standard_B2s"
    admin_username = var.db_username
    admin_password = var.db_password
    network_interface_ids = [azurerm_network_interface.nic01.id]
    disable_password_authentication = false
    

    os_disk {
      name = "osdisk-${random_string.myrandomstring.id}"
      caching = "ReadWrite"
      disk_size_gb = 128
      storage_account_type = "StandardSSD_LRS"

    }

    source_image_reference {

        #az vm image list -o table
        publisher = "OpenLogic"
        offer = "CentOS"
        sku = "7.5"
        version = "latest"
      
    }
    #custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
    tags = var.default_tags

    /*connection {
      type = "ssh"
      host = self.public_ip_address
      user = self.admin_username
      password = self.admin_password
    }
    provisioner "remote-exec" {
        inline = [
          "sudo -s",
          "sudo yum install -y mc"
        ]
      
    }
*/
}
