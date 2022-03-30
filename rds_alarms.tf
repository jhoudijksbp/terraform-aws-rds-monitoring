resource "aws_cloudwatch_metric_alarm" "cpu_utilization_too_high" {
  for_each            = toset(var.rds_instance_ids)
  alarm_name          = "rds-${each.key}-highCPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = 600
  statistic           = "Average"
  threshold           = 90
  alarm_description   = "Average database CPU utilization is too high."
  tags                = module.jeffrey_tags.tags
  #alarm_actions       = var.actions_alarm
  #ok_actions          = var.actions_ok

  dimensions = {
    DBInstanceIdentifier = each.key
  }
}
