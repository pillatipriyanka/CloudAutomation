variable "name" {
  description = "Name of the Step Functions state machine"
  type        = string
}

variable "role_arn" {
  description = "IAM role ARN for Step Functions"
  type        = string
}

variable "definition_path" {
  description = "Path to the state machine definition (ASL JSON file)"
  type        = string
}
