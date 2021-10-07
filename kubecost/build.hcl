metadata {
  name = "kubecost"
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
  path = "helm/kubecost"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "68deb62dce59220195a416cdf80c4426d0964afa09ad44cfb3315da2ea45fde6"
    retries = 0
  }
}
