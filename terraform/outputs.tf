# outputs.tf

output "ecs_cluster_name" {
  value = aws_ecs_cluster.cluster.name
}

output "ecs_service_name" {
  value = aws_ecs_service.service.name
}

output "ecs_task_definition_arn" {
  value = aws_ecs_task_definition.task.arn
}

output "ecr_repository_url" {
  value = aws_ecr_repository.ecr.repository_url
}

output "load_balancer_dns_name" {
  value = aws_lb.lb.dns_name
}

output "security_group_id" {
  value = aws_security_group.sg.id
}

output "alb_security_group_id" {
  value = aws_security_group.alb.id
}