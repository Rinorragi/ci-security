provider "kubernetes" {
  config_path    = "${path.module}/kubeconfig.dummy" # Avoid having to set up a real cluster if plans are scanned
  config_context = "dummy-context"
}

resource "kubernetes_pod" "vulnerable_pod" {
  metadata {
    name      = "vulnerable-pod"
    namespace = "default" # Vulnerable: Using default namespace
  }

  spec {
    container {
      name  = "nginx"
      image = "nginx:latest"

      security_context {
        privileged                 = true # Vulnerable: Privileged container
        allow_privilege_escalation = true # Vulnerable: Privilege escalation allowed
      }

      # Vulnerable: Missing liveness and readiness probes
    }
  }
}
