output "experiments" {
  value = [for param in var.experiments : {
    name = param.experiment_name
    id   = databricks_mlflow_experiment.this[param.experiment_name].id
  } if length(var.experiments) != 0]
  description = "Provides name and unique identifier for the experiment"
}
