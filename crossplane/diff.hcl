metadata {
  path = "crossplane"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
}

step "terraform" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "crossplane",
  ]

  sha     = ""
  retries = 0
}

step "kube-init" {
  wkdir   = "crossplane"
  target  = "crossplane/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "crossplane",
  ]

  sha     = ""
  retries = 0
}

step "helm" {
  wkdir   = "crossplane/helm"
  target  = "crossplane/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "crossplane",
  ]

  sha     = ""
  retries = 0
}
