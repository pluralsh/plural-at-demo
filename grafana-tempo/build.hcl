metadata {
  name = "grafana-tempo"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/grafana-tempo"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "81420bd2725985609dc84c6578bd1c50f04ba6bcb36ab6bd9890bc77702dfcaa"
    retries = 0
  }
}
