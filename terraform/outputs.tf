# outputs.tf

output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_ids" {
  value = [
    aws_subnet.subnets[0].id,
    aws_subnet.subnets[1].id,
    aws_subnet.subnets[2].id
  ]
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "route_table_id" {
  value = aws_route_table.rt.id
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.cluster.name
}

output "ecs_service_name" {
  value = aws_ecs_service.service.name
}

/*output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.task.arn
}
*/

output "ecr_repository_url" {
  value = aws_ecr_repository.ecr.repository_url
}

output "security_group_id" {
  value = aws_security_group.external.id
}

output "alb_security_group_id" {
  value = aws_security_group.internal.id

}

output "aws_cloudwatch_dashboard_url" {
  value = "https://${var.aws_region}.console.aws.amazon.com/cloudwatch/home?region=${var.aws_region}#dashboards/dashboard/${var.app_prefix}-dashboard"
}

output "load_balancer_dns_url" {
  value = "http://${aws_lb.lb.dns_name}"
}
