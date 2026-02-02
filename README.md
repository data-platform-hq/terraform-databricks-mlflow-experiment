# Databricks Workspace Terraform module
Terraform module used for Databricks Mlflow experiment creation.

## Usage
This module provides an ability to create Mlflow experiment in Databricks

```hcl
module "mlflow_experiments" {
  source  = "data-platform-hq/mlflow-experiment/databricks"
  version = "1.0.0"

  experiments = [
    {
      experiment_name = "experiment1"
      permissions = [
        {
          group_name       = "admin_group"
          permission_level = "CAN_MANAGE"
        },
        {
          group_name       = "some_group"
          permission_level = "CAN_READ"
        }
      ]
    },
    {
      experiment_name = "experiment2"
      experiment_path = "/Workspace/Shared/shared_experiment"
      permissions = [
        {
          group_name       = "users"
          permission_level = "CAN_READ"
        }
      ]
    }
  ]

  providers = {
    databricks = databricks.workspace
  }
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | ~> 1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_databricks"></a> [databricks](#provider\_databricks) | ~> 1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [databricks_mlflow_experiment.this](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/mlflow_experiment) | resource |
| [databricks_permissions.this](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/permissions) | resource |
| [databricks_current_user.me](https://registry.terraform.io/providers/databricks/databricks/latest/docs/data-sources/current_user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_experiments"></a> [experiments](#input\_experiments) | Set of objects with parameters to configure Databricks mlflow experiments and assign permissions to it for certain custom groups | <pre>set(object({<br/>    experiment_name        = string<br/>    experiment_path        = optional(string, null)<br/>    artifact_location      = optional(string, null)<br/>    experiment_description = optional(string, "Managed by Terraform")<br/>    permissions = optional(set(object({<br/>      group_name       = string<br/>      permission_level = string<br/>    })), [])<br/>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_experiments"></a> [experiments](#output\_experiments) | Mlflow experiment Name to ID map |
<!-- END_TF_DOCS -->

## License

Apache 2 Licensed. For more information please see [LICENSE](https://github.com/data-platform-hq/terraform-databricks-mlflow-experiment/blob/main/LICENSE)
