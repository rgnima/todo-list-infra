## aks ##

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aksrgnima"
  location            = var.rgLocation
  resource_group_name = var.rgName
  dns_prefix          = "aksrgnimapref" 
  sku_tier            = "Free"
  #kubernetes_version  = "1.29.4"
  #azure_policy_enabled = true
   default_node_pool {
    name       = "default"
    node_count = 1    
    vm_size    = "Standard_D2s_v3"
  }
  #default_node_pool {
  #  name       = "devpool01"
  #  node_count = 1
  #  vm_size    = "Standard_D2s_v3"
  #  os_sku = "Ubuntu"
  #  os_disk_size_gb = 30
  #  os_disk_type = "Managed"
    #vnet_subnet_id = data.azurerm_subnet.SubNetAKSPool.id
    #enable_auto_scaling = false        
    
  #}
  #network_profile {
  #  network_plugin    = "azure"
  #  load_balancer_sku = "standard"
  #  network_policy = "calico"
    
  #}

  identity {
    type = "SystemAssigned"
  }
  tags = {
    Environment = "CodigoFacilito"
  }
} 
output "client_certificate" {
  value     = azurerm_kubernetes_cluster.example.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw

  sensitive = true
}

