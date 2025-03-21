terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "2.0.0"
    }
  }
}

resource "random_pet" "server" {
}
