metadata {
  path = "istio"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:VyIJ6ZqMjw/T1WknAPbPu2YeYRe8q7ZoZ5Gad+BmoCg="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "istio/terraform"
  target  = "istio/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:VyIJ6ZqMjw/T1WknAPbPu2YeYRe8q7ZoZ5Gad+BmoCg="
  retries = 1
}

step "terraform-output" {
  wkdir   = "istio"
  target  = "istio/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "istio",
  ]

  sha     = "h1:VyIJ6ZqMjw/T1WknAPbPu2YeYRe8q7ZoZ5Gad+BmoCg="
  retries = 0
}

step "kube-init" {
  wkdir   = "istio"
  target  = "istio/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "eb4479fb6d326959382c5f738b0bfb72fbbb9090c3a6fe8adcf2dbd322fb5f93"
  retries = 0
}

step "crds" {
  wkdir   = "istio"
  target  = "istio/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "istio",
  ]

  sha     = "h1:uk6ylA6IFs05czBbNJJAxchdZsH+K8yK5O/xxjy8u5Y="
  retries = 0
}

step "bounce" {
  wkdir   = "istio"
  target  = "istio/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "istio",
  ]

  sha     = "h1:ISXCCqOgklHHa2eHUXxN7GTIMX2w6AwJdNjYsHZWWds="
  retries = 0
}
