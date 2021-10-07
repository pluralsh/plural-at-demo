metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:D4ee5SBEPFj6Dok9IBQzREpxHWbjSOhaAnagIC2kMJY="
  retries = 0
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:D4ee5SBEPFj6Dok9IBQzREpxHWbjSOhaAnagIC2kMJY="
  retries = 0
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "1bbff04407ae36e75b3e91e0922b68e92de58e6be0a84103932e64cc1b2beb5a"
  retries = 0
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:JrIxmUqYyE6Yfa2KU5NAc2TKNAoa9WOYx57iRoP2ccw="
  retries = 0
}
