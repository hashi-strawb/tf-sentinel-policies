param "latest_override" {
  value = {
    "registry.terraform.io/hashicorp/aws" = ["4.0.0", "5.1.0", "5.50.0"]
  }
}

mock "tfplan/v2" {
  module {
    // Uses v5.x, but not necessarily as new as v5.50.0
    source = "../../mocks/check-provider-version/mock-tfplan-current-major-v2.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}