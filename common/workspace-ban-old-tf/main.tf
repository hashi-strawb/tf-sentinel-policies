terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "1.3.1"
    }
  }
}

resource "random_pet" "server" {
}
