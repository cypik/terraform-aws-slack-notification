provider "aws" {
  region = "ap-south-1"
}

module "slack-alert" {
  source                            = ".././"
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