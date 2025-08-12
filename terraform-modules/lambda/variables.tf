variable "function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "handler" {
  description = "Handler for the Lambda function"
  type        = string
  default     = "hello_lambda.lambda_handler"
}

variable "runtime" {
  description = "Runtime for the Lambda function"
  type        = string
  default     = "python3.12"
}

variable "role_arn" {
  description = "IAM role ARN for Lambda"
  type        = string
}

variable "filename" {
  description = "Path to the deployment package"
  type        = string
}

variable "environment_variables" {
  description = "Environment variables for the Lambda function"
  type        = map(string)
  default     = {}
}
