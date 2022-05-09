resource "aws_sns_topic" "rds_monitoring" {
  name              = "rds-monitoring-topic"
  kms_master_key_id = var.kms_key_id
}

resource "aws_sns_topic_subscription" "rds_monitoring_email" {
  count     = "${var.send_email_alerts == true ? 1 : 0}"
  endpoint  = var.email_endpoint
  protocol  = "email"
  topic_arn = aws_sns_topic.rds_monitoring.arn
}
