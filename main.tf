terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.14.0"
    }
  }
}
#data "azuread_client_config" "current" {}
## aks ##
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aksrgnima"
  location            = var.rgLocation
  resource_group_name = var.rgName
  dns_prefix          = "aksrgnima"  
  sku_tier            = "Free"
  kubernetes_version  = "1.30.5"
  #azure_policy_enabled = true
  
  default_node_pool {
    name       = "devpool01"
    node_count = 1
    vm_size    = "Standard_B2s"
    os_sku = "Ubuntu"
    os_disk_size_gb = 30
    os_disk_type = "Managed"
    #vnet_subnet_id = data.azurerm_subnet.SubNetAKSPool.id
    #enable_auto_scaling = false        
    
  }
  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    network_policy = "calico"
    
  }

  identity {
    type = "SystemAssigned"
  }
 
}

## acr ##
resource "azurerm_container_registry" "acr" {
  name                = "acrdemontt"
  resource_group_name = var.rgName 
  location            = var.rgLocation 
  sku                 = "Basic"
  admin_enabled       = false

}
resource "azurerm_role_assignment" "aks_role" {
  principal_id                     = data.azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}