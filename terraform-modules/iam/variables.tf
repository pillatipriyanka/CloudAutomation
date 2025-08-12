variable "policy_name" {
  description = "The name of the custom IAM policy"
  type        = string
}

variable "policy_description" {
  description = "Description of the custom IAM policy"
  type        = string
  default     = ""
}

variable "policy_document" {
  description = "The JSON policy to attach to the custom policy"
  type        = string
}

variable "role_name" {
  description = "The name of the custom IAM role"
  type        = string
}

variable "assume_role_policy" {
  description = "The trust relationship policy JSON"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}