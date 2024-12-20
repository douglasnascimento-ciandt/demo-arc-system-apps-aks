resource "helm_release" "arc_controller" {
  count            = var.arc_enabled == true ? 1 : 0
  name             = var.arc_resource_name
  repository       = "oci://ghcr.io/actions/actions-runner-controller-charts"
  chart            = "gha-runner-scale-set-controller"
  version          = var.arc_version
  namespace        = "arc-system"
  create_namespace = true
  force_update     = var.force_update
  wait             = var.wait
  reuse_values     = var.reuse_values
  replace          = var.replace
  timeout          = var.timeout
  disable_webhooks = var.disable_webhooks
  recreate_pods    = var.recreate_pods

  values = [
    "${file("values/github-arc.yml")}"
  ]
}

resource "helm_release" "arc_rss_primary" {
  count            = var.arc_enabled == true ? 1 : 0
  name             = var.arc_rss_primary_resource_name
  repository       = "oci://ghcr.io/actions/actions-runner-controller-charts"
  chart            = "gha-runner-scale-set"
  version          = var.arc_rss_primary_version
  namespace        = var.arc_rss_primary_namespace
  create_namespace = true
  force_update     = var.force_update
  wait             = var.wait
  reuse_values     = var.reuse_values
  replace          = var.replace
  timeout          = var.timeout
  disable_webhooks = var.disable_webhooks
  recreate_pods    = var.recreate_pods

  values = [
    "${file("values/github-arc-rss-primary.yml")}"
  ]

  set {
    name  = "githubConfigUrl"
    value = var.arc_github_url
  }

  set {
    name  = "githubConfigSecret.github_token"
    value = var.arc_github_token
  }

  set {
    name  = "maxRunners"
    value = var.arc_rss_primary_max_runners
  }

  set {
    name  = "minRunners"
    value = var.arc_rss_primary_min_runners
  }

  set {
    name  = "runnerGroup"
    value = var.arc_rss_primary_runner_group
  }

  set {
    name  = "runnerScaleSetName"
    value = var.arc_rss_primary_resource_name
  }

  depends_on = [helm_release.arc_controller]
}

resource "helm_release" "arc_rss_secondary" {
  count            = var.arc_enabled == true ? 1 : 0
  name             = var.arc_rss_secondary_resource_name
  repository       = "oci://ghcr.io/actions/actions-runner-controller-charts"
  chart            = "gha-runner-scale-set"
  version          = var.arc_rss_secondary_version
  namespace        = var.arc_rss_secondary_namespace
  create_namespace = true
  force_update     = var.force_update
  wait             = var.wait
  reuse_values     = var.reuse_values
  replace          = var.replace
  timeout          = var.timeout
  disable_webhooks = var.disable_webhooks
  recreate_pods    = var.recreate_pods

  values = [
    "${file("values/github-arc-rss-secondary.yml")}"
  ]

  set {
    name  = "githubConfigUrl"
    value = var.arc_github_url
  }

  set {
    name  = "githubConfigSecret.github_token"
    value = var.arc_github_token
  }

  set {
    name  = "maxRunners"
    value = var.arc_rss_secondary_max_runners
  }

  set {
    name  = "minRunners"
    value = var.arc_rss_secondary_min_runners
  }

  set {
    name  = "runnerGroup"
    value = var.arc_rss_secondary_runner_group
  }

  set {
    name  = "runnerScaleSetName"
    value = var.arc_rss_secondary_resource_name
  }

  depends_on = [helm_release.arc_controller]
}