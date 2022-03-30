variable "email_endpoint" {
  type        = string
  default     = ""
  description = "Comma separated list of e-mail addresses"
}

variable "kms_key_id" {
  type        = string
  default     = null
  description = "The KMS key ID used for SNS topic"
}

variable "rds_instance_ids" {
  type        = list(string)
  description = "List of RDS instance Id's"
}

variable "send_email_alerts" {
  type        = bool
  default     = false
  description = "If this module needs to sent e-mail alerts"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to attach to RDS monitoring resouces"
}
