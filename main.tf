module "labels" {
  source      = "cypik/labels/aws"
  version     = "1.0.2"
  name        = var.name
  repository  = var.repository
  environment = var.environment
  managedby   = var.managedby
  label_order = var.label_order
}


module "lambda" {
  source  = "cypik/lambda/aws"
  version = "1.0.2"

  name                              = module.labels.id
  environment                       = var.environment
  filename                          = var.filename
  handler                           = var.handler
  runtime                           = var.runtime
  compatible_architectures          = var.compatible_architectures
  timeout                           = var.timeout
  cloudwatch_logs_retention_in_days = var.cloudwatch_logs_retention_in_days

  iam_actions         = var.iam_actions
  create_layers       = var.create_layers
  layer_names         = var.layer_names
  layer_filenames     = var.layer_filenames
  compatible_runtimes = var.compatible_runtimes

  source_arns   = var.source_arns
  actions       = var.actions
  principals    = var.principals
  statement_ids = var.statement_ids

  variables = {
    SLACK_WEBHOOK_URL = var.SLACK_WEBHOOK_URL
  }
}

resource "null_resource" "zip_lambda" {
  provisioner "local-exec" {
    command = "cd ../lambda_packages/ && rm -f index.zip && zip index.zip lambda_function.py"
  }

  triggers = {
    always_run = timestamp()
  }
}
