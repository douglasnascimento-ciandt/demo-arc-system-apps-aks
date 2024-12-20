# Deploy Argocd in cluster
resource "helm_release" "argocd" {
  count            = var.argocd_enabled == true ? 1 : 0
  name             = var.argocd_resource_name
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = var.argocd_version
  namespace        = "argocd"
  create_namespace = true
  force_update     = var.force_update
  wait             = var.wait
  reuse_values     = var.reuse_values
  replace          = var.replace
  timeout          = var.timeout
  disable_webhooks = var.disable_webhooks
  recreate_pods    = var.recreate_pods

  values = [
    "${file("values/argocd.yml")}"
  ]

  # set {
  #   name  = "global.domain"
  #   value = var.argocd_domain
  # }
}