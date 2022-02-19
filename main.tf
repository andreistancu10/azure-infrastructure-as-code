 terraform {
  required_version = ">= 0.11" 
  backend "azurerm" {
  storage_account_name = "__terraformstorageaccount__"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
	access_key  ="__storagekey__"
	}
	}
  provider "azurerm" {
  features {}
}



resource "random_string" "myrandomstring" {
  length  = 6
  upper   = false
  special = false
  number  = true
  
}
resource "azurerm_resource_group" "resource_group" {
  location = var.default_location
  name     =  var.resource_group
  tags = var.default_tags
}