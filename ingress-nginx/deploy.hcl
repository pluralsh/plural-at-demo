metadata {
  path = "ingress-nginx"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:imNfBS4Ih+zIXnfCk9y9Bcpl/nKHdWwx7WKcnAlKHfY="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "ingress-nginx/terraform"
  target  = "ingress-nginx/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:imNfBS4Ih+zIXnfCk9y9Bcpl/nKHdWwx7WKcnAlKHfY="
  retries = 1
}

step "terraform-output" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "ingress-nginx",
  ]

  sha     = "h1:imNfBS4Ih+zIXnfCk9y9Bcpl/nKHdWwx7WKcnAlKHfY="
  retries = 0
}

step "kube-init" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "358ab349ed28048f27842c3356a828bf0a28ca4a33f670c31d881e3e85d6fba3"
  retries = 0
}

step "crds" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "ingress-nginx",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "ingress-nginx"
  target  = "ingress-nginx/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "ingress-nginx",
  ]

  sha     = "h1:Y1S30lXfzq0zib9499xzIMMYZDF4AWxIvxUzk6shOn0="
  retries = 0
}
