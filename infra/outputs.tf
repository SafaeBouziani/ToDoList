output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

output "ingress_service_ip" {
  value = try(
    data.kubernetes_service.nginx_lb.status[0].load_balancer[0].ingress[0].ip,
    "PENDING"
  )
}
