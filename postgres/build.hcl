metadata {
  name = "postgres"
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
  path = "helm/postgres"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "6e85a4f2a7376cf5d6a9edb0e5cf01feae996b56cdf4347663014dd87f23ce12"
    retries = 0
  }
}
