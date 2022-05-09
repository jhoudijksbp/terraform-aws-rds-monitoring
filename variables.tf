variable "cpu_utilization_too_high_threshold" {
  type        = string
  default     = "90"
  description = "Alarm threshold for the 'highCPUUtilization' alarm"
}

variable "disable_actions_blocks" {
  type        = list(string)
  default     = []
  description = "List of RDS instance Id's for which to disable alarm actions for blocked transactions"
}

variable "disable_actions_cpu" {
  type        = list(string)
  default     = []
  description = "List of RDS instance Id's for which to disable alarm actions for CPUUtilization"
}

variable "disable_actions_lag" {
  type        = list(string)
  default     = []
  description = "List of RDS instance Id's for which to disable alarm actions for Replication Lag"
}

variable "email_endpoint" {
  type        = string
  default     = ""
  description = "Comma separated list of e-mail addresses"
}

variable "evaluation_period" {
  type        = string
  default     = "5"
  description = "The evaluation period over which to use when triggering alarms."
}

variable "kms_key_id" {
  type        = string
  default     = null
  description = "The KMS key ID used for SNS topic"
}

variable "monitoring_instances_list" {
  type        = list(string)
  description = "List of instances which is needed for the for_each"
}

variable "replicalag_threshold" {
  type        = string
  default     = "300000" # 5 minutes
  description = "Alarm threshold in ms for the 'replicaLag' alarm"
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

variable "statistic_period" {
  type        = string
  default     = "60"
  description = "The number of seconds that make each statistic period."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags to attach to RDS monitoring resouces"
}
