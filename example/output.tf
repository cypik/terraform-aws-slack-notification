output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = module.slack-alert.lambda_function_name
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = module.slack-alert.lambda_function_arn
}

output "lambda_function_invoke_arn" {
  description = "Invoke ARN of the Lambda function"
  value       = module.slack-alert.lambda_function_invoke_arn
}

output "lambda_log_group_name" {
  description = "CloudWatch log group name"
  value       = module.slack-alert.lambda_log_group_name
}