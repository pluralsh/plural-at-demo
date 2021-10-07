metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:njqxpImoZY8Jr3hiXRibYGa5aIG6/WCMCj4YM6ry13I="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:njqxpImoZY8Jr3hiXRibYGa5aIG6/WCMCj4YM6ry13I="
  retries = 1
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha     = "h1:njqxpImoZY8Jr3hiXRibYGa5aIG6/WCMCj4YM6ry13I="
  retries = 0
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "9176a8d38a350a82273340f8eca65977d54bb3fad79044a1e1ba90e5215bbdd3"
  retries = 0
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha     = "h1:RVv+4M77PJRYVB6Y7EdMaGrG8GT6Pkxdgv50thEt2N4="
  retries = 0
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha     = "h1:hYSx697aR1pSxJQX8Q8J7R2gCBOE7+q2jEIo4XEXzGU="
  retries = 0
}
