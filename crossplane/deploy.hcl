metadata {
  path = "crossplane"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:ZOFw3/SH908AXuXmJdn/beRu+OrIFZAvw64Km5ii4Uk="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "crossplane/terraform"
  target  = "crossplane/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:ZOFw3/SH908AXuXmJdn/beRu+OrIFZAvw64Km5ii4Uk="
  retries = 1
}

step "terraform-output" {
  wkdir   = "crossplane"
  target  = "crossplane/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "crossplane",
  ]

  sha     = "h1:ZOFw3/SH908AXuXmJdn/beRu+OrIFZAvw64Km5ii4Uk="
  retries = 0
}

step "kube-init" {
  wkdir   = "crossplane"
  target  = "crossplane/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "6de0342cde0f1bbc35403fb01a35017445d33c3a7a7a11a9e6435220d856d3fd"
  retries = 0
}

step "crds" {
  wkdir   = "crossplane"
  target  = "crossplane/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "crossplane",
  ]

  sha     = "h1:ZSCjhft99lNDm80BNhvAsKjp+BBAoRvonlkjmd7xPFg="
  retries = 0
}

step "bounce" {
  wkdir   = "crossplane"
  target  = "crossplane/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "crossplane",
  ]

  sha     = "h1:NkF7KEojFWWsRDdlxsLZJMS58qWIMKIMuJKZi389WVo="
  retries = 0
}
