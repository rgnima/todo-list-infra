## aks ##

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aksrgnima"
  location            = var.rgLocation
  resource_group_name = var.rgName
  dns_prefix          = "aksrgnimapref" 
  sku_tier            = "Free"
  kubernetes_version  = "1.29.4"
  #azure_policy_enabled = true
   default_node_pool {
    name       = "default"
    node_count = 1    
    vm_size    = "Standard_D2s_v3"
  }
  
  identity {
    type = "SystemAssigned"
  }
  tags = {
    Environment = "CodigoFacilito"
  }
} 
output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw

  sensitive = true
}

