output "experiments" {
  value       = { for param in var.experiments : param.experiment_name => databricks_mlflow_experiment.this[param.experiment_name].id }
  description = "Mlflow experiment Name to ID map"
}
