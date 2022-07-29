resource "aws_cloudwatch_log_group" "myapp_log_group" {
  name              = var.cloudwatch_logsname
  retention_in_days = var.cloudwatch_retention

  tags = {
    Name = var.cloudwatch_tagname
  }
}

resource "aws_cloudwatch_log_stream" "myapp_log_stream" {
  name           = var.cloudwatch_streamname
  log_group_name = aws_cloudwatch_log_group.myapp_log_group.name
}