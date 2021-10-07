metadata {
  path = "postgres"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:fWBzBYVLiFN42/sDzCgsCHUMeCvKhG4h048Dsbmdal8="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "postgres/terraform"
  target  = "postgres/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:fWBzBYVLiFN42/sDzCgsCHUMeCvKhG4h048Dsbmdal8="
  retries = 1
}

step "terraform-output" {
  wkdir   = "postgres"
  target  = "postgres/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "postgres",
  ]

  sha     = "h1:fWBzBYVLiFN42/sDzCgsCHUMeCvKhG4h048Dsbmdal8="
  retries = 0
}

step "kube-init" {
  wkdir   = "postgres"
  target  = "postgres/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "e62d4f1e9243e41987975237c856746409ee5ffa11ec342cbf9e3cdd452fbfe8"
  retries = 0
}

step "crds" {
  wkdir   = "postgres"
  target  = "postgres/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "postgres",
  ]

  sha     = "h1:+KtpiGhaAg9Db5EdGawKjfUTQqpyrQFC87h9Gj2L/zQ="
  retries = 0
}

step "bounce" {
  wkdir   = "postgres"
  target  = "postgres/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "postgres",
  ]

  sha     = "h1:ns0Es7duXRM0JX7qGd1rgZ9tTvPv3hx1eJ5fN6KH6zg="
  retries = 0
}
