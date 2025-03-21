resource "kubectl_manifest" "application_argocd_ingress_nginx" {
  depends_on = [
    kubectl_manifest.application_argocd_aws_load_balancer_controller
   ]
  yaml_body = templatefile("${path.module}/templates/argocd-apps/ingress-nginx.yaml", {
      GITHUB_URL = local.repo_url
      GITHUB_BRANCH = local.repo_branch
    }
    )

  provisioner "local-exec" {
    command = "kubectl wait --for=jsonpath=.status.health.status=Healthy --timeout=600s -n argocd application/ingress-nginx"

    interpreter = ["/bin/bash", "-c"]
  }
}


