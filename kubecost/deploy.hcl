metadata {
  path = "kubecost"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:vdm4/P6ioneDEJr9EAaoVjAfI4oWZGmiFxiML3TO+lQ="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "kubecost/terraform"
  target  = "kubecost/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:vdm4/P6ioneDEJr9EAaoVjAfI4oWZGmiFxiML3TO+lQ="
  retries = 1
}

step "terraform-output" {
  wkdir   = "kubecost"
  target  = "kubecost/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "7686a7c43b798ed174a08fd6df8a42e9b4634a738fe9adf3a935d198c1a7b616"
  retries = 0
}

step "crds" {
  wkdir   = "kubecost"
  target  = "kubecost/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "kubecost",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "kubecost"
  target  = "kubecost/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "kubecost",
  ]

  sha     = "h1:+S8RC54c7NBUwXWrlxyGq/PvWrdYIVxDXyQRfTtPltM="
  retries = 0
}
