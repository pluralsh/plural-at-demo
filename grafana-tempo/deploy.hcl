metadata {
  path = "grafana-tempo"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "grafana-tempo/terraform"
  target  = "grafana-tempo/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:x5rja9EGcb5+9alFaQbIv1UIeLMfn9duAjl1l+RcyY0="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "grafana-tempo/terraform"
  target  = "grafana-tempo/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:x5rja9EGcb5+9alFaQbIv1UIeLMfn9duAjl1l+RcyY0="
  retries = 1
}

step "terraform-output" {
  wkdir   = "grafana-tempo"
  target  = "grafana-tempo/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "grafana-tempo",
  ]

  sha     = "h1:x5rja9EGcb5+9alFaQbIv1UIeLMfn9duAjl1l+RcyY0="
  retries = 0
}

step "kube-init" {
  wkdir   = "grafana-tempo"
  target  = "grafana-tempo/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "96e0114eb6f7c372b4fb7c90810af5d881a030bfec8dff07604d6d7e0ec3676f"
  retries = 0
}

step "crds" {
  wkdir   = "grafana-tempo"
  target  = "grafana-tempo/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "grafana-tempo",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "grafana-tempo"
  target  = "grafana-tempo/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "grafana-tempo",
  ]

  sha     = "h1:APxybsvQNsPyLR6sTxH7Ugp3ToAoKVcAgVEBmB7omQc="
  retries = 0
}
