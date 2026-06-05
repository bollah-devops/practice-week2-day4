output "app_public_ip" {
  value = aws_instance.task_manager_server.public_ip
}

output "app_instance_id" {
  value = aws_instance.task_manager_server.id
}