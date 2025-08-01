output "lambda_function_name" {
  description = "Name of the Lambda function"
  value       = module.lambda.name
}

output "lambda_function_arn" {
  description = "ARN of the Lambda function"
  value       = module.lambda.arn
}

output "lambda_function_invoke_arn" {
  description = "Invoke ARN of the Lambda function"
  value       = module.lambda.invoke_arn
}

output "lambda_log_group_name" {
  description = "CloudWatch log group name"
  value       = module.lambda.lambda_log_group_name
}