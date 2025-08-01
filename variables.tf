variable "name" {
  type        = string
  default     = ""
  description = "Name  (e.g. `app` or `api`)."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment (e.g. `prod`, `dev`, `staging`)."
}

variable "repository" {
  type        = string
  default     = "https://github.com/cypik/terraform-aws-slack-notification.git"
  description = "Terraform current module repo"
}

variable "label_order" {
  type        = list(any)
  default     = ["name", "environment"]
  description = "Label order, e.g. `name`,`application`."
}

variable "managedby" {
  type        = string
  default     = "info@cypik.com"
  description = "ManagedBy, eg 'info@cypik.com'."
}

variable "filename" {
  type        = string
  description = "Lambda deployment package filename"
}

variable "handler" {
  type        = string
  description = "Lambda function handler"
}

variable "runtime" {
  type        = string
  description = "Runtime for Lambda"
}

variable "compatible_architectures" {
  type        = list(string)
  description = "Compatible architectures"
}

variable "timeout" {
  type        = number
  description = "Lambda function timeout"
}

variable "cloudwatch_logs_retention_in_days" {
  type        = number
  description = "Retention in days for logs"
}

variable "iam_actions" {
  type        = list(string)
  description = "IAM actions for execution role"
  default     = []
}

variable "create_layers" {
  type        = bool
  default     = true
  description = "Whether to create layers"
}

variable "layer_names" {
  type        = list(string)
  default     = ["requests"]
  description = "Layer names"
}

variable "layer_filenames" {
  description = "List of Lambda layer filenames"
  type        = list(string)
  default     = ["../lambda_packages/layer.zip"]
}

variable "compatible_runtimes" {
  type        = list(any)
  default     = []
  description = "Compatible runtimes for the Lambda layer"
}

variable "source_arns" {
  type        = list(string)
  default     = []
  description = "List of source ARNs for permission"
}

variable "actions" {
  type        = list(string)
  description = "Lambda permissions actions"
}

variable "principals" {
  type        = list(string)
  description = "Principals for Lambda permission"
}

variable "statement_ids" {
  type        = list(string)
  description = "Statement IDs for Lambda permissions"
}

variable "SLACK_WEBHOOK_URL" {
  type        = string
  description = "Slack webhook URL to send alerts"
}