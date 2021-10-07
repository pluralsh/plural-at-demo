metadata {
  path = "nvidia-operator"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:y9Bg/6Me04QmUgPcQkwLxu4u+zoujyblCeF2JzaXjUk="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "nvidia-operator/terraform"
  target  = "nvidia-operator/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:y9Bg/6Me04QmUgPcQkwLxu4u+zoujyblCeF2JzaXjUk="
  retries = 1
}

step "terraform-output" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "nvidia-operator",
  ]

  sha     = "h1:y9Bg/6Me04QmUgPcQkwLxu4u+zoujyblCeF2JzaXjUk="
  retries = 0
}

step "kube-init" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "a83a4f49ead1141abbba50fcee067e8c08cf3598eb970cf1d71b412a95b3059a"
  retries = 0
}

step "crds" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "nvidia-operator",
  ]

  sha     = "h1:hEajuUG/qDLGzXeB88VnlXSSlSXcYLJdMevhlQLB8oM="
  retries = 0
}

step "bounce" {
  wkdir   = "nvidia-operator"
  target  = "nvidia-operator/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "nvidia-operator",
  ]

  sha     = "h1:97QTpaStd1jztzQP05z/V3DPic7Lm9IiDnh8d4uW+yw="
  retries = 0
}
