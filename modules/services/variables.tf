# variables.tf
variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default = "myEcsTaskExecutionRole"
}

variable "az_count" {
  description = "Number of AZs to cover in a given region"
  default     = "2"
}

variable "health_check_path" {
  default = "/"
}

variable "alb_name" {
  description = "Load_Balancer_Name"
  default     = "myapp-load-balancer"
}

variable "tg_name" {
  description = "ALB_Target_Group_Name"
  default     = "myapp-target-group"
}

variable "alb_port" {
  description = "alb_port_number"
  default     = "80"
}

variable "albtarget_targettype" {
  description = "alb_target_group_target_type"
  default     = "ip"
}

variable "alb_health" {
  description = "Health_check_ALB"
  default     = "3" 
}

variable "alb_interval" {
  description = "interval_ALB"
  default     = "30" 
}

variable "alb_matcher" {
  description = "matcher_ALB"
  default     = "200" 
}

variable "alb_protocol" {
  default     = "HTTP"
}

variable "alb_timeout" {
  description = "timeout_alb"
  default     = "3" 
}

variable "alb_unhealthy" {
  description = "unhealthy_thershold_alb"
  default     = "2" 
}

variable "healthcheck_protocol" {
  default     = "HTTP"
}

variable "alblistner_frontend" {
  description = "ALB_default_type"
  default     = "forward"
}
variable "asg_service_name" {
  description = "Auto_Scaling_Group_Name"
  default     = "ecs" 
}

# Automatically scale capacity up by one


variable "scalingpolicy_coolup" {   
  default  = "60"
}

variable "scalingpolicy_scalabledimension" {   
  default  = "ecs:service:DesiredCount"
}

#variable "scalingpolicy_resourceid" {   
  //description = "ghbnj"
  //default  = "service/${aws_ecs_cluster.main.name}/${aws_ecs_service.main.name}"
#}

variable "autoscalepolicy_nameup" {
   type   = string
  default     = "myapp_scale_up"
}

variable "autoscalepolicy_adjusttype" {
   type   = string
  default     = "ChangeInCapacity"
}

variable "autoscalepolicy_metric_type" {
   type   = string
  default     = "Maximum"
}

variable "adjustment_mil_bound" {
   type   = string
  default     = 0
}

variable "adjustment_scaling_adjustment" {
   type   = string
  default     = 1
}

variable "adjustment_scaling_adjustment2" {
   type   = string
  default     = -1
}
# Automatically scale capacity down by one

variable "autoscalepolicy_namedown" {
   type   = string
  default     = "myapp_scale_down"
}

variable "scalingpolicy_cooldown" {   
  default  = "60"
}

variable "autoscalepolicy_adjusttype1" {
   type   = string
  default     = "ChangeInCapacity"
}

# CloudWatch alarm that triggers the autoscaling up policy

variable "cloudwatch_alarmnameup" {   
  default  = "myapp_cpu_utilization_high"
}

variable "cloudwatch_metricname" {   
  default  = "CPUUtilization"
}

variable "cloudwatch_period" {   
  default  = "60"
}

variable "cloudwatch_statistic" {   
  default  = "Average"
}

variable "cloudwatch_compoperator_up" {   
  default  = "GreaterThanOrEqualToThreshold"
}

variable "cloudwatch_threshold" {   
  default  = "85"
}
variable "cloudwatch_namespace1" {   
  default  = "AWS/ECS"
}

variable "cloudwatch_evaluationperiod" {   
  default  = "2"
}

# CloudWatch alarm that triggers the autoscaling down policy

variable "cloudwatch_alarmnamedown" {   
  default  = "myapp_cpu_utilization_low"
}

variable "cloudwatch_compoperator_down" {   
  default  = "LessThanOrEqualToThreshold"
}

variable "cloudwatch_evaluationperiod2" {   
  default  = "2"
}

variable "cloudwatch_metricname2" {   
  default  = "CPUUtilization"
}

variable "cloudwatch_namespace2" {   
  default  = "AWS/ECS"
}

variable "cloudwatch_period2" {   
  default  = "60"
}

variable "cloudwatch_statistic2" {   
  default  = "Average"
}

variable "cloudwatch_threshold2" {   
  default  = "10"
}

#ECS#

variable "ecs_family_networkmode" {
  description = "Ecs_Task_Definition_family_networkmode"
  default     =  "awsvpc"
}

variable "ecs_family_compatabilities" {
  description = "Ecs_Task_Definition_family_required_compatabilities"
  default     = ["FARGATE"]
}

variable "service_name" {}

variable "aws_ecs_launchtype" {
  description = "AWS_ECS_Launch_type"
  default     = "FARGATE"
}

variable "aws_ecs_loadbalancer" {
  description = "AWS_ECS_Loadbalancer_name"
  default     = "myapp"
}

variable "assign_publicip" {
  description = "In_Network_Configuration_Public_Ip"
  default     = true
}

# logs.tf

variable "cloudwatch_logsname" {
  description = "cloudwatch_log-group_name"
  default     = "/ecs/myapp"
}

variable "cloudwatch_retention" {
  description = "cloudwatch_log-group_retention_days"
  default     = 30
}

variable "cloudwatch_tagname" {
  description = "cloudwatch_log-group_tag_name"
  default     = "cb-log-group"
}

variable "cloudwatch_streamname" {
  description = "cloudwatch_log-group_log_stream_name"
  default     = "my-log-stream"
}
#JSON_TEMPLATE

variable "networkmode" {
  type        = string
  default     = "awsvpc"
}

variable "json_name" {
  type        = string
  default     = "myapp"
}

variable "log_driver" {
  type        = string
  default     = "awslogs"
}


variable "log_streamprefix" {
  type        = string
  default     = "ecs"
}

variable "log_group" {
  type        = string
  default     = "/ecs/myapp"
}

# network.tf

variable "main_cidr" {
  description  = "main_cidr_values"
  default     = "172.17.0.0/16"
}

variable "awseip_vpc" {
  description  = "aws_eip_vpc_value"
  default     =  "true"
}
variable "destination_cidr" {
  description  = "destination_cidr_values"
  default     = "0.0.0.0/0"
}
# ECS task execution role data

variable "taskexecution_role" {
  description  = "Iam_Policy_Document_Version"
  default     = "2012-10-17"
}

variable "taskexecution_effect" {
  description  = "Iam_Policy_Document_effect"
  default     = "Allow"
}

variable "taskexecution_actions" {
  description  = "Iam_Policy_Document_actions"
  default     = ["sts:AssumeRole"]
}


variable "taskexecution_princip_type" {
  description  = "Iam_Policy_Document_Principal_type"
  default     = "service"
}

variable "taskexecution_princip_identifiers" {
  description  = "Iam_Policy_Document_Principal_identifiers"
  default     = ["ecs-tasks.amazonaws.com"]
}

variable "taskexecution_policy_arn" {
  description  = "Iam_Policy_Document_Policy_arn"
  default     =  "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# security.tf

variable "securitygroup_name" {
  description  = "Security_Group_Name"
  default     =  "myapp-load-balancer-security-group"
}

variable "securitygroup_description" {
  description  = "Security_Group_description"
  default     =  "controls access to the ALB"
}

variable "securitygroup_protocol" {
  description  = "Security_Group_ingress_protocol"
  default     =  "tcp"
}

variable "securitygroup_cidr" {
  description  = "Security_Group_ingress_cidr"
  default     =  ["0.0.0.0/0"]
}

variable "securitygroup_fromport" {
  description  = "Security_Group_ingress_from_port"
  default     =  0
}

variable "securitygroup_toport" {
  description  = "Security_Group_ingress_toport"
  default     =  0
}

variable "securitygroup_protocol1" {
  description  = "Security_Group_ingress_protocol"
  default     =  -1
}

variable "asgecs_taskname" {
  description  = "Security_Group_ecs_task_security_group_name"
  default      =  "myapp-ecs-tasks-security-group"
}  

variable "asgecs_taskdescription" {
  description  = "Security_Group_ecs_task_description"
  default      =  "allow inbound access from the ALB only"
}  

variable "container_name" {}

variable "container_port" {}

variable "cluster_name" {}

variable "accountid" {}

variable "env" {}

variable "repo_name" {}

variable "scan_image_on_push" {}

variable "image_tag_mutability" {}

variable "bucket_name" {}

variable "tags" {
  description = "Tags to set on the bucket."
  type        = map(string)
  default     = {}
}

variable "acl" {}

variable "versioning" {}

variable "health_check" {}

variable "fargate_cpu" {}

variable "app_port" {}

variable "fargate_memory" {}

variable "desired_count" {}

variable "aws_region" {}