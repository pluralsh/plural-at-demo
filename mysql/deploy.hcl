metadata {
  path = "mysql"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:sq2xapEYp3afK1y/98Nng5N+E/DV8+w9iI3DhCbhqws="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "mysql/terraform"
  target  = "mysql/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:sq2xapEYp3afK1y/98Nng5N+E/DV8+w9iI3DhCbhqws="
  retries = 1
}

step "terraform-output" {
  wkdir   = "mysql"
  target  = "mysql/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "mysql",
  ]

  sha     = "h1:sq2xapEYp3afK1y/98Nng5N+E/DV8+w9iI3DhCbhqws="
  retries = 0
}

step "kube-init" {
  wkdir   = "mysql"
  target  = "mysql/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "c7c14bcd7b5b0a45db02cb7c16871e4b6afee3c14651c0569911a571837e8fe7"
  retries = 0
}

step "crds" {
  wkdir   = "mysql"
  target  = "mysql/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "mysql",
  ]

  sha     = "h1:uNJ+QzJsx9nBbinejxqtfpphNDus5Iv4NgnqVvJYKi4="
  retries = 0
}

step "bounce" {
  wkdir   = "mysql"
  target  = "mysql/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "mysql",
  ]

  sha     = "h1:LH9ZMSssd8wztS6udyXptNGHeXv88UfEf8yaY6udU1c="
  retries = 0
}
