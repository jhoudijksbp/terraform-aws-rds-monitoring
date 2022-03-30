variable "kms_key_id" {
  type        = string
  default     = null
  description = "The KMS key ID used for SNS topic"
}

variable "rds_instance_ids" {
  type        = list(string)
  description = "List of RDS instance Id's"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to attach to RDS monitoring resouces"
}
