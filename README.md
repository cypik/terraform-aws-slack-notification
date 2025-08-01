# Terraform-aws-slack-notification

# Terraform AWS Cloud Slack-Notification Module

## Table of Contents
- [Introduction](#introduction)
- [Usage](#usage)
- [Examples](#Examples)
- [Author](#Author)
- [License](#license)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Introduction
This Terraform module creates an AWS Slack-Notification  along with additional configuration options.
## Usage
To use this module, you should have Terraform installed and configured for AWS. This module provides the necessary Terraform configuration for creating AWS resources, and you can customize the inputs as needed. Below is an example of how to use this module:
## Examples

## Example: slack-notification

```hcl
module "slack-alert" {
  source                            = "cypik/slack-notification/aws"
  version                           = "1.0.0"
  name                              = "slack"
  filename                          = "../lambda_packages/index.zip"
  handler                           = "lambda_function.handler"
  runtime                           = "python3.9"
  compatible_architectures          = ["x86_64"]
  timeout                           = 10
  cloudwatch_logs_retention_in_days = 7

  iam_actions = [
    "logs:CreateLogGroup",
    "logs:CreateLogStream",
    "logs:PutLogEvents"
  ]

  compatible_runtimes = [
    ["python3.12", "python3.11"],
  ]

  actions       = ["lambda:InvokeFunction"]
  principals    = ["s3.amazonaws.com"]
  statement_ids = ["AllowExecutionFromS3"]

  SLACK_WEBHOOK_URL = ""
}
```


## Examples
For detailed examples on how to use this module, please refer to the [Example](https://github.com/cypik/terraform-aws-slack-notification/tree/master/example) directory within this repository.

## Author
Your Name Replace **MIT** and **Cypik** with the appropriate license and your information. Feel free to expand this README with additional details or usage instructions as needed for your specific use case.

## License
This project is licensed under the **MIT** License - see the [LICENSE](https://github.com/cypik/terraform-aws-slack-notification/blob/master/LICENSE) file for details.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.12.2 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 6.4.0 |
| <a name="requirement_null"></a> [null](#requirement\_null) | ~> 3.2.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_null"></a> [null](#provider\_null) | ~> 3.2.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_labels"></a> [labels](#module\_labels) | cypik/labels/aws | 1.0.2 |
| <a name="module_lambda"></a> [lambda](#module\_lambda) | cypik/lambda/aws | 1.0.2 |

## Resources

| Name | Type |
|------|------|
| [null_resource.zip_lambda](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_SLACK_WEBHOOK_URL"></a> [SLACK\_WEBHOOK\_URL](#input\_SLACK\_WEBHOOK\_URL) | Slack webhook URL to send alerts | `string` | n/a | yes |
| <a name="input_actions"></a> [actions](#input\_actions) | Lambda permissions actions | `list(string)` | n/a | yes |
| <a name="input_cloudwatch_logs_retention_in_days"></a> [cloudwatch\_logs\_retention\_in\_days](#input\_cloudwatch\_logs\_retention\_in\_days) | Retention in days for logs | `number` | n/a | yes |
| <a name="input_compatible_architectures"></a> [compatible\_architectures](#input\_compatible\_architectures) | Compatible architectures | `list(string)` | n/a | yes |
| <a name="input_compatible_runtimes"></a> [compatible\_runtimes](#input\_compatible\_runtimes) | Compatible runtimes for the Lambda layer | `list(any)` | `[]` | no |
| <a name="input_create_layers"></a> [create\_layers](#input\_create\_layers) | Whether to create layers | `bool` | `true` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (e.g. `prod`, `dev`, `staging`). | `string` | `""` | no |
| <a name="input_filename"></a> [filename](#input\_filename) | Lambda deployment package filename | `string` | n/a | yes |
| <a name="input_handler"></a> [handler](#input\_handler) | Lambda function handler | `string` | n/a | yes |
| <a name="input_iam_actions"></a> [iam\_actions](#input\_iam\_actions) | IAM actions for execution role | `list(string)` | `[]` | no |
| <a name="input_label_order"></a> [label\_order](#input\_label\_order) | Label order, e.g. `name`,`application`. | `list(any)` | <pre>[<br>  "name",<br>  "environment"<br>]</pre> | no |
| <a name="input_layer_filenames"></a> [layer\_filenames](#input\_layer\_filenames) | List of Lambda layer filenames | `list(string)` | <pre>[<br>  "../lambda_packages/layer.zip"<br>]</pre> | no |
| <a name="input_layer_names"></a> [layer\_names](#input\_layer\_names) | Layer names | `list(string)` | <pre>[<br>  "requests"<br>]</pre> | no |
| <a name="input_managedby"></a> [managedby](#input\_managedby) | ManagedBy, eg 'info@cypik.com'. | `string` | `"info@cypik.com"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name  (e.g. `app` or `api`). | `string` | `""` | no |
| <a name="input_principals"></a> [principals](#input\_principals) | Principals for Lambda permission | `list(string)` | n/a | yes |
| <a name="input_repository"></a> [repository](#input\_repository) | Terraform current module repo | `string` | `"https://github.com/cypik/terraform-aws-slack-notification.git"` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | Runtime for Lambda | `string` | n/a | yes |
| <a name="input_source_arns"></a> [source\_arns](#input\_source\_arns) | List of source ARNs for permission | `list(string)` | `[]` | no |
| <a name="input_statement_ids"></a> [statement\_ids](#input\_statement\_ids) | Statement IDs for Lambda permissions | `list(string)` | n/a | yes |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | Lambda function timeout | `number` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_lambda_function_arn"></a> [lambda\_function\_arn](#output\_lambda\_function\_arn) | ARN of the Lambda function |
| <a name="output_lambda_function_invoke_arn"></a> [lambda\_function\_invoke\_arn](#output\_lambda\_function\_invoke\_arn) | Invoke ARN of the Lambda function |
| <a name="output_lambda_function_name"></a> [lambda\_function\_name](#output\_lambda\_function\_name) | Name of the Lambda function |
| <a name="output_lambda_log_group_name"></a> [lambda\_log\_group\_name](#output\_lambda\_log\_group\_name) | CloudWatch log group name |
<!-- END_TF_DOCS -->