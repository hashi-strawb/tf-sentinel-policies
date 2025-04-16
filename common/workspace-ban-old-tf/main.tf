terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "1.0.0"
    }
  }
}

provider "random" {
  version = "1.0.0"
}

resource "random_string" "string" {
  length = 32
}
