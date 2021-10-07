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

  sha     = "4ec906f321fd29b48d7a5aa73fc69b6647ecdac72eb98f2dcb3105397d39d6f3"
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

  sha     = "h1:WUPlMtE/6t5U9RA72DS334ElK4dM2fKo94KgzLigRnw="
  retries = 0
}
