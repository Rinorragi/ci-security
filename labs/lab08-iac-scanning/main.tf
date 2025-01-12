variable "db_password" {
  description = "Database password (should not be hardcoded)"
  type        = string
  default     = "SuperSecretPassword123" # Vulnerable: Hardcoded sensitive value
}

resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo 'Using password: ${var.db_password}'"
  }
}
