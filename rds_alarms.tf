// Blocked transactions
resource "aws_cloudwatch_metric_alarm" "blocked_transactions" {
  for_each            = { for instance in var.monitoring_instances_list : "${instance.stack}_${instance.counter}" => instance }
  actions_enabled     = contains(var.disable_actions_blocks, element(var.rds_instance_ids, each.value.counter)) ? false : true
  alarm_name          = replace("${each.value.stack}-${each.value.counter}-BlockedTransactions", "_", "-")
  alarm_actions       = [aws_sns_topic.rds_monitoring.arn]
  alarm_description   = "One or more blocked transactions detected!"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = var.evaluation_period
  metric_name         = "BlockedTransactions"
  namespace           = "AWS/RDS"
  ok_actions          = [aws_sns_topic.rds_monitoring.arn]
  period              = var.statistic_period
  statistic           = "Maximum"
  threshold           = 0
  treat_missing_data  = "breaching"
  tags                = var.tags

  dimensions = {
    DBInstanceIdentifier = element(var.rds_instance_ids, each.value.counter)
  }
}
"rds-rds_test_one-2-BlockedTransactions"
//CPUUtilization
resource "aws_cloudwatch_metric_alarm" "cpu_utilization_too_high" {
  for_each            = { for instance in var.monitoring_instances_list : "${instance.stack}_${instance.counter}" => instance }
  actions_enabled     = contains(var.disable_actions_cpu, element(var.rds_instance_ids, each.value.counter)) ? false : true
  alarm_name          = replace("${each.value.stack}-${each.value.counter}-highCPUUtilization", "_", "-")
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
  treat_missing_data  = "breaching"
  tags                = var.tags

  dimensions = {
    DBInstanceIdentifier = element(var.rds_instance_ids, each.value.counter)
  }
}

// Lag replication
resource "aws_cloudwatch_metric_alarm" "replicalag_too_high" {
  for_each            = { for instance in var.monitoring_instances_list : "${instance.stack}_${instance.counter}" => instance }
  actions_enabled     = contains(var.disable_actions_lag, element(var.rds_instance_ids, each.value.counter)) ? false : true
  alarm_name          = replace("${each.value.stack}-${each.value.counter}-replicaLag", "_", "-")
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
  treat_missing_data  = "ignore"
  tags                = var.tags

  dimensions = {
    DBInstanceIdentifier = element(var.rds_instance_ids, each.value.counter)
  }
}
