terraform {
  backend "s3" {
    bucket = "eks-devops-project-terraform-state"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}
