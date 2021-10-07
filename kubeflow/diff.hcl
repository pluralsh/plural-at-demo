metadata {
  path = "kubeflow"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:YPqwH37Jicx7+6Dy8B77v/DDDAfqRPdbObxvXL8aZOs="
  retries = 0
}

step "terraform" {
  wkdir   = "kubeflow/terraform"
  target  = "kubeflow/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "kubeflow",
  ]

  sha     = "h1:YPqwH37Jicx7+6Dy8B77v/DDDAfqRPdbObxvXL8aZOs="
  retries = 0
}

step "kube-init" {
  wkdir   = "kubeflow"
  target  = "kubeflow/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "kubeflow",
  ]

  sha     = "aca77b6ff36a89e903994a35882d22daa7b9b0361efc2099c79dbef67e29058f"
  retries = 0
}

step "helm" {
  wkdir   = "kubeflow/helm"
  target  = "kubeflow/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kubeflow",
  ]

  sha     = "h1:KkL+xJ0HImOubQppBqePMO51/cwsZJ4Ctb/PvUdv7Kg="
  retries = 0
}
