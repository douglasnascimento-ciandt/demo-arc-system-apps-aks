# Default variables

variable "azure_environment" {
  description = "The environment for the Azure resources, such as 'dev', 'staging', 'hml', or 'prod'."
  type        = string
  default     = "dev"
}

variable "azure_cluster_name" {
  description = "The name of the Kubernetes cluster to be created."
  type        = string
  default     = "aks-demo-arc-001"
}

variable "azure_resource_group_name" {
  description = "Resource group name."
  type        = string
  default     = "rg-demo-arc-devsecops-001"
}


# Helm variables

variable "force_update" {
  description = "Forces the update of the release, even if there are no changes in the chart or values."
  type        = bool
  default     = false
}

variable "wait" {
  description = "Specifies whether Terraform should wait until all pods are ready before completing the deployment."
  type        = bool
  default     = true
}

variable "reuse_values" {
  description = "If set to true, reuse the values from the last release instead of using the provided values."
  type        = bool
  default     = false
}

variable "replace" {
  description = "If set to true, replace the existing release if a resource conflict error occurs during the update."
  type        = bool
  default     = false
}

variable "timeout" {
  description = "Specifies the maximum time (in seconds) Terraform should wait before cancelling the deployment operation."
  type        = number
  default     = 300
}

variable "disable_webhooks" {
  description = "If set to true, disables pre- and post-installation webhooks during the Helm deployment."
  type        = bool
  default     = false
}

variable "recreate_pods" {
  description = "If set to true, recreate pods even if configurations have not changed, useful to force pod rotation."
  type        = bool
  default     = false
}


# Prometheus variables

variable "prometheus_enabled" {
  description = "Specifies whether Prometheus should be enabled in the Kubernetes cluster."
  type        = bool
  default     = true
}

variable "prometheus_resource_name" {
  description = "The name of the Prometheus resource within the Kubernetes cluster."
  type        = string
  default     = "prometheus"
}

variable "prometheus_version" {
  description = "The version of Prometheus to be installed or managed."
  type        = string
  default     = "25.27.0"
}


# Istio variables

variable "istio_enabled" {
  description = "Specifies whether Istio should be enabled in the Kubernetes cluster."
  type        = bool
  default     = true
}

variable "istio_version" {
  description = "The version of Istio to be installed or managed."
  type        = string
  default     = "1.23.2"
}

variable "istio_resource_name" {
  description = "The name of the Istio resource within the Kubernetes cluster."
  type        = string
  default     = "istio"
}

# ARC systems

variable "arc_enabled" {
  description = "Specifies whether ARC should be enabled in the Kubernetes cluster."
  type        = bool
  default     = true
}

variable "arc_github_url" {
  description = "Authentication token github."
  type        = string
  default     = "https://github.com/devsecops-lab-ciandt"
}

variable "arc_github_token" {
  description = "Authentication token github."
  type        = string
  sensitive   = true
}

variable "arc_resource_name" {
  description = "The name of the ARC resource within the Kubernetes cluster."
  type        = string
  default     = "arc"
}

variable "arc_version" {
  description = "The version of ARC to be installed or managed."
  type        = string
  default     = "0.9.3"
}

variable "arc_rss_primary_resource_name" {
  description = "The name of the runner scale set primary resource within the Kubernetes cluster."
  type        = string
  default     = "arc-primary"
}

variable "arc_rss_primary_version" {
  description = "The version of runner scale set to be installed or managed."
  type        = string
  default     = "0.9.3"
}

variable "arc_rss_primary_namespace" {
  description = "The namespace of runner scale set primary to be installed."
  type        = string
  default     = "arc-runners-primary"
}

variable "arc_rss_primary_max_runners" {
  description = "The maximum number of runners that can be created for the primary RSS resource."
  type        = number
  default     = 7
}

variable "arc_rss_primary_min_runners" {
  description = "The minimum number of runners that must always be active for the primary RSS resource."
  type        = number
  default     = 1
}

variable "arc_rss_primary_runner_group" {
  description = "The name of the github runner group for the primary RSS resource."
  type        = string
  default     = "primary-java"
}

variable "arc_rss_secondary_resource_name" {
  description = "The name of the runner scale set secondary resource within the Kubernetes cluster."
  type        = string
  default     = "arc-secondary"
}

variable "arc_rss_secondary_version" {
  description = "The version of runner scale set to be installed or managed."
  type        = string
  default     = "0.9.3"
}

variable "arc_rss_secondary_namespace" {
  description = "The namespace of runner scale set secondary to be installed."
  type        = string
  default     = "arc-runners-secondary"
}

variable "arc_rss_secondary_max_runners" {
  description = "The maximum number of runners that can be created for the secondary RSS resource."
  type        = number
  default     = 7
}

variable "arc_rss_secondary_min_runners" {
  description = "The minimum number of runners that must always be active for the secondary RSS resource."
  type        = number
  default     = 1
}

variable "arc_rss_secondary_runner_group" {
  description = "The name of the github runner group for the secondary RSS resource."
  type        = string
  default     = "secondary-java"
}


# Argocd variables

variable "argocd_enabled" {
  description = "Specifies whether Argo should be enabled in the Kubernetes cluster."
  type        = bool
  default     = true
}

variable "argocd_version" {
  description = "The version of Argo to be installed or managed."
  type        = string
  default     = "7.6.12"
}

variable "argocd_resource_name" {
  description = "The name of the Argo resource within the Kubernetes cluster."
  type        = string
  default     = "argocd"
}

variable "argocd_domain" {
  description = "The domain name for accessing the ArgoCD server."
  type        = string
  default     = "argocd.example.com"
}

# Argocd apps variables

variable "argocd_apps_version" {
  description = "The version of Argo apps to be installed or managed."
  type        = string
  default     = "2.0.2"
}

variable "argocd_apps_resource_name" {
  description = "The name of the Argo apps resource within the Kubernetes cluster."
  type        = string
  default     = "argocd-app"
}

# Nexus variables

variable "nexus_enabled" {
  description = "Specifies whether Nexus should be enabled in the Kubernetes cluster."
  type        = bool
  default     = true
}

variable "nexus_version" {
  description = "The version of Nexus to be installed or managed."
  type        = string
  default     = "42.0.1"
}

variable "nexus_resource_name" {
  description = "The name of the Nexus resource within the Kubernetes cluster."
  type        = string
  default     = "nexus"
}

# variable "nexus_cluster_enabled" {
#   description = "Enabled cluster mode in Nexus HA"
#   type        = bool
#   default     = false
# }

# variable "nexus_cluster_replicas" {
#   description = "Number of replicas for the cluster mode in Nexus HA"
#   type        = number
#   default     = 1
# }

# variable "nexus_namespace_create_enabled" {
#   description = "Enable namespace creation in Nexus"
#   type        = bool
#   default     = false
# }