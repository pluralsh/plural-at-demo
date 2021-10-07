metadata {
  path = "redis"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = ""
  retries = 0
}

step "terraform" {
  wkdir   = "redis/terraform"
  target  = "redis/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "redis",
  ]

  sha     = ""
  retries = 0
}

step "kube-init" {
  wkdir   = "redis"
  target  = "redis/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "redis",
  ]

  sha     = ""
  retries = 0
}

step "helm" {
  wkdir   = "redis/helm"
  target  = "redis/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "redis",
  ]

  sha     = ""
  retries = 0
}
