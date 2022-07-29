# auto_scaling.tf

resource "aws_appautoscaling_target" "target" {
  service_namespace  = var.asg_service_name
  resource_id        = "service/${aws_ecs_cluster.main.name}/${aws_ecs_service.main.name}"
  scalable_dimension = var.scalingpolicy_scalabledimension
  min_capacity       = "3"
  max_capacity       = "6"
}

# Automatically scale capacity up by one
resource "aws_appautoscaling_policy" "up" {
  name               = var.autoscalepolicy_nameup
  service_namespace  = var.asg_service_name
  resource_id        = "service/${aws_ecs_cluster.main.name}/${aws_ecs_service.main.name}"
  scalable_dimension = var.scalingpolicy_scalabledimension

  step_scaling_policy_configuration {
    adjustment_type         = var.autoscalepolicy_adjusttype
    cooldown                = var.scalingpolicy_coolup
    metric_aggregation_type = var.autoscalepolicy_metric_type

    step_adjustment {
      metric_interval_lower_bound = var.adjustment_mil_bound
      scaling_adjustment          = var.adjustment_scaling_adjustment
    }
  }

  depends_on = [aws_appautoscaling_target.target]
}

# Automatically scale capacity down by one
resource "aws_appautoscaling_policy" "down" {
  name               = var.autoscalepolicy_namedown
  service_namespace  = var.asg_service_name
  resource_id        = "service/${aws_ecs_cluster.main.name}/${aws_ecs_service.main.name}"
  scalable_dimension = var.scalingpolicy_scalabledimension

  step_scaling_policy_configuration {
    adjustment_type         = var.autoscalepolicy_adjusttype1
    cooldown                = var.scalingpolicy_cooldown
    metric_aggregation_type = var.autoscalepolicy_metric_type

    step_adjustment {
      metric_interval_upper_bound = var.adjustment_mil_bound
      scaling_adjustment          = var.adjustment_scaling_adjustment2
    }
  }

  depends_on = [aws_appautoscaling_target.target]
}

# CloudWatch alarm that triggers the autoscaling up policy
resource "aws_cloudwatch_metric_alarm" "service_cpu_high" {
  alarm_name          = var.cloudwatch_alarmnameup
  comparison_operator = var.cloudwatch_compoperator_up
  evaluation_periods  = var.cloudwatch_evaluationperiod
  metric_name         = var.cloudwatch_metricname
  namespace           = var.cloudwatch_namespace1
  period              = var.cloudwatch_period
  statistic           = var.cloudwatch_statistic
  threshold           = var.cloudwatch_threshold

  dimensions = {
    ClusterName = aws_ecs_cluster.main.name
    ServiceName = aws_ecs_service.main.name
  }

  alarm_actions = [aws_appautoscaling_policy.up.arn]
}

# CloudWatch alarm that triggers the autoscaling down policy
resource "aws_cloudwatch_metric_alarm" "service_cpu_low" {
  alarm_name          = var.cloudwatch_alarmnamedown
  comparison_operator = var.cloudwatch_compoperator_down
  evaluation_periods  = var.cloudwatch_evaluationperiod2
  metric_name         = var.cloudwatch_metricname2
  namespace           = var.cloudwatch_namespace2
  period              = var.cloudwatch_period2
  statistic           = var.cloudwatch_statistic2
  threshold           = var.cloudwatch_threshold2

  dimensions = {
    ClusterName = aws_ecs_cluster.main.name
    ServiceName = aws_ecs_service.main.name
  }

  alarm_actions = [aws_appautoscaling_policy.down.arn]
}