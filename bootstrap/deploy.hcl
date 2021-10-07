metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:vf3jTCDtfQf2KGM0NctNqPtSlokW9FdLYHzk7PwNvxU="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:vf3jTCDtfQf2KGM0NctNqPtSlokW9FdLYHzk7PwNvxU="
  retries = 1
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha     = "h1:vf3jTCDtfQf2KGM0NctNqPtSlokW9FdLYHzk7PwNvxU="
  retries = 0
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "abe9b7a7fa27ea6fa9018287c7ee960fb1e3171eb36ee825012bd596ea954f29"
  retries = 0
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha     = "h1:MP4FGRK7DYfJHQZZ97swhR4uU0T0wInfmyrUR4O2j+c="
  retries = 0
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha     = "h1:37ckidA0O4hLOQmXBfLARCOi8uwkMOy4H/2WPyeSpZw="
  retries = 0
}
