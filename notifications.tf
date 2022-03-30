resource "aws_sns_topic" "rds_monitoring" {
  name              = "rds-monitoring-topic"
  kms_master_key_id = var.kms_key_id
}
