metadata {
  path = "kubecost"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:vdm4/P6ioneDEJr9EAaoVjAfI4oWZGmiFxiML3TO+lQ="
  retries = 0
}

step "terraform" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "kubecost",
  ]

  sha     = "h1:vdm4/P6ioneDEJr9EAaoVjAfI4oWZGmiFxiML3TO+lQ="
  retries = 0
}

step "kube-init" {
  wkdir   = "kubecost"
  target  = "kubecost/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "kubecost",
  ]

  sha     = "7686a7c43b798ed174a08fd6df8a42e9b4634a738fe9adf3a935d198c1a7b616"
  retries = 0
}

step "helm" {
  wkdir   = "kubecost/helm"
  target  = "kubecost/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "kubecost",
  ]

  sha     = "h1:+S8RC54c7NBUwXWrlxyGq/PvWrdYIVxDXyQRfTtPltM="
  retries = 0
}
