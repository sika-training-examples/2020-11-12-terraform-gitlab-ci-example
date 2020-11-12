resource "digitalocean_kubernetes_cluster" "cluster1" {
  name   = "cluster1"
  region = "nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.19.3-do.2"

  node_pool {
    name       = "cluster1"
    size       = "s-2vcpu-2gb"
    node_count = 1
  }
}

output "cluster1_kubeconfig" {
  value     = digitalocean_kubernetes_cluster.cluster1.kube_config.0.raw_config
  sensitive = true
}
