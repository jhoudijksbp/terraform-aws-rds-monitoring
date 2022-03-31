//CPUUtilization
resource "aws_cloudwatch_metric_alarm" "cpu_utilization_too_high" {
  for_each            = toset(var.rds_instance_ids)
  alarm_name          = "rds-${each.key}-highCPUUtilization"
  alarm_actions       = [aws_sns_topic.rds_monitoring.arn]
  alarm_description   = "Average database CPU utilization is too high."
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_period
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  ok_actions          = [aws_sns_topic.rds_monitoring.arn]
  period              = var.statistic_period
  statistic           = "Average"
  threshold           = var.cpu_utilization_too_high_threshold
  tags                = var.tags

  dimensions = {
    DBInstanceIdentifier = each.key
  }
}

// Disk Utilization
resource "aws_cloudwatch_metric_alarm" "disk_queue_depth_too_high" {
  for_each            = toset(var.rds_instance_ids)
  alarm_name          = "rds-${each.key}-highDiskQueueDepth"
  alarm_actions       = [aws_sns_topic.rds_monitoring.arn]
  alarm_description   = "Average database disk queue depth is too high, performance may be negatively impacted."
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_period
  metric_name         = "DiskQueueDepth"
  namespace           = "AWS/RDS"
  ok_actions          = [aws_sns_topic.rds_monitoring.arn]
  period              = var.statistic_period
  statistic           = "Average"
  threshold           = var.disk_queue_depth_too_high_threshold
  tags                = var.tags

  dimensions = {
    DBInstanceIdentifier = each.key
  }
}

// Lag replication
resource "aws_cloudwatch_metric_alarm" "replicalag_too_high" {
  for_each            = toset(var.rds_instance_ids)
  alarm_name          = "rds-${each.key}-replicaLag"
  alarm_actions       = [aws_sns_topic.rds_monitoring.arn]
  alarm_description   = "Average database replicaLagis too high, readers are too far behind master"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_period
  metric_name         = "AuroraReplicaLag"
  namespace           = "AWS/RDS"
  ok_actions          = [aws_sns_topic.rds_monitoring.arn]
  period              = var.statistic_period
  statistic           = "Average"
  threshold           = var.replicalag_threshold
  tags                = var.tags

  dimensions = {
    DBInstanceIdentifier = each.key
  }
}
