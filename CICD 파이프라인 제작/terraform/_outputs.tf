output "ssh-command" {
  value = "ssh -i rex.pem ec2-user@${aws_instance.this.public_dns}"
}

output "ecr_repo_url" {
  value = aws_ecr_repository.this.repository_url
}

output "app_url" {
  value = "http://${aws_instance.this.public_dns}:8080"
}