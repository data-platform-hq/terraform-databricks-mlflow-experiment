resource "databricks_mlflow_experiment" "this" {
  for_each = {
    for v in var.experiments : (v.experiment_name) => v
  }

  name              = "${each.value.experiment_path}/${each.value.experiment_name}"
  artifact_location = each.value.artifact_location
  description       = each.value.experiment_description
}

resource "databricks_permissions" "this" {
  for_each = {
    for v in var.experiments : (v.experiment_name) => v
    if length(v.permissions) != 0
  }

  experiment_id = databricks_mlflow_experiment.this.id

  dynamic "access_control" {
    for_each = each.value.permissions
    content {
      group_name       = access_control.value.group_name
      permission_level = access_control.value.permission_level
    }
  }
}
