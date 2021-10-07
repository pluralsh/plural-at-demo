terraform {
  backend "s3" {
    bucket = "at-kubeflow-demo-tf-state"
    key = "at-kubeflow-demo/bootstrap/terraform.tfstate"
    region = "eu-central-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.55.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0.3"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

data "aws_eks_cluster" "cluster" {
  name = module.aws-bootstrap.cluster_name
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.aws-bootstrap.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
}


module "aws-bootstrap" {
  source = "./aws-bootstrap"

### BEGIN MANUAL SECTION <<aws-bootstrap>>

### END MANUAL SECTION <<aws-bootstrap>>


  vpc_name = "at-kubeflow-demo"
  cluster_name = "at-kubeflow-demo"
  
  map_roles = [
    {
      rolearn = "arn:aws:iam::776604912447:role/at-kubeflow-demo-console"
      username = "console"
      groups = ["system:masters"]
    }
  ]

}
