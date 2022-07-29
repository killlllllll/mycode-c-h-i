resource "aws_security_group" "lb" {
  name        = var.securitygroup_name
  description = var.securitygroup_description
  vpc_id      = aws_vpc.main.id

  ingress {
    protocol    = var.securitygroup_protocol
    from_port   = var.app_port
    to_port     = var.app_port
    cidr_blocks = var.securitygroup_cidr
  }

  egress {
    protocol    = var.securitygroup_protocol1
    from_port   = var.securitygroup_fromport
    to_port     = var.securitygroup_toport
    cidr_blocks = var.securitygroup_cidr
  }
}

resource "aws_security_group" "ecs_tasks" {
  name        = var.asgecs_taskname
  description = var.asgecs_taskdescription
  vpc_id      = aws_vpc.main.id

  ingress {
    protocol        = var.securitygroup_protocol
    from_port       = var.app_port
    to_port         = var.app_port
    security_groups = [aws_security_group.lb.id]
  }

  egress {
    protocol    = var.securitygroup_protocol1
    from_port   = var.securitygroup_fromport
    to_port     = var.securitygroup_toport
    cidr_blocks = var.securitygroup_cidr
  }
}