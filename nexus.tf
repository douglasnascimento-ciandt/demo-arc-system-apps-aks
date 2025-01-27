# Deploy Nexus in cluster
resource "helm_release" "nexus" {
  count            = var.nexus_enabled == true ? 1 : 0
  name             = var.nexus_resource_name
  repository       = "https://sonatype.github.io/helm3-charts"
  chart            = "nexus-repository-manager"
  version          = var.nexus_version
  namespace        = "nexusrepo"
  create_namespace = true
  force_update     = var.force_update
  wait             = var.wait
  reuse_values     = var.reuse_values
  replace          = var.replace
  timeout          = var.timeout
  disable_webhooks = var.disable_webhooks
  recreate_pods    = var.recreate_pods
}