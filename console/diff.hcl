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

  sha     = "500f9ddb0c3074b6a1e18819d5b5d2060fd3775ebece9a8500e40a3ea88abd9f"
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

  sha     = "h1:p/Ku/tzH/H6xMDXQOgw330soG2XL1fBiMrSLs/k379I="
  retries = 0
}
