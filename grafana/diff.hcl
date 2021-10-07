metadata {
  path = "grafana"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:wDD1Tau8W+S07zAH8IW87uEEpGzgy2yfKmP1zFjMhSk="
  retries = 0
}

step "terraform" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "grafana",
  ]

  sha     = "h1:wDD1Tau8W+S07zAH8IW87uEEpGzgy2yfKmP1zFjMhSk="
  retries = 0
}

step "kube-init" {
  wkdir   = "grafana"
  target  = "grafana/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "grafana",
  ]

  sha     = "4cbb6ac45f92f67918a14e387a4633cb0bda75178eb67adf2ca7ff0af10e7135"
  retries = 0
}

step "helm" {
  wkdir   = "grafana/helm"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "grafana",
  ]

  sha     = "h1:4BOOjNzf3DGcsuE5gmGOgMkNlNPOSgyBpKxDJcJMI18="
  retries = 0
}
