terraform {
  required_version = "1.6.3"

  required_providers {
    aws = {
        version = "5.24.0"
    }
  }
}

provider "aws" {
  region = var.region
}
