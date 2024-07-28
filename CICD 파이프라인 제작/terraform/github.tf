resource "github_repository" "this" {
  name       = "docker-cicd-test-repo"
  visibility = "private"
  auto_init  = true
}

resource "github_repository_file" "workflow" {
  repository = github_repository.this.name
  branch     = "main"
  file       = ".github/workflows/simple.yaml"
  content    = file("${path.module}/files/simple-cicd.yaml")
}

resource "github_repository_file" "dockerfile" {
  repository = github_repository.this.name
  branch     = "main"
  file       = "Dockerfile"
  content    = file("${path.module}/files/Dockerfile")
}

resource "github_repository_file" "packagejson" {
  repository = github_repository.this.name
  branch     = "main"
  file       = "package.json"
  content    = file("${path.module}/files/package.json")
}

resource "github_repository_file" "serverjs" {
  repository = github_repository.this.name
  branch     = "main"
  file       = "server.js"
  content    = file("${path.module}/files/server.js")
}

resource "github_actions_secret" "host" {
  repository      = github_repository.this.name
  secret_name     = "HOST"
  plaintext_value = aws_instance.this.public_dns
}

resource "github_actions_secret" "username" {
  repository      = github_repository.this.name
  secret_name     = "USERNAME"
  plaintext_value = "ec2-user"
}

resource "github_actions_secret" "ssh_pem_key" {
  repository      = github_repository.this.name
  secret_name     = "SSH_PEM_KEY"
  plaintext_value = tls_private_key.this.private_key_pem
}

resource "github_actions_secret" "access_key" {
  repository      = github_repository.this.name
  secret_name     = "AWS_ACCESS_KEY_ID"
  plaintext_value = var.access_key
}

resource "github_actions_secret" "secret_key" {
  repository      = github_repository.this.name
  secret_name     = "AWS_SECRET_ACCESS_KEY"
  plaintext_value = var.secret_key
}

resource "github_actions_secret" "ecr" {
  repository      = github_repository.this.name
  secret_name     = "ECR_REPO_URL"
  plaintext_value = aws_ecr_repository.this.repository_url
}