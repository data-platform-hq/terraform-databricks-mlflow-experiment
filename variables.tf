variable "experiments" {
  type = set(object({
    experiment_name        = string
    experiment_path        = optional(string, null)
    artifact_location      = optional(string, null)
    experiment_description = optional(string, "Managed by Terraform")
    permissions = optional(set(object({
      group_name       = string
      permission_level = string
    })), [])
  }))
  description = "Set of objects with parameters to configure Databricks mlflow experiments and assign permissions to it for certain custom groups"
}
