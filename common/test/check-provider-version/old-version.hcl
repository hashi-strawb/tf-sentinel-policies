param "latest_override" {
  value = {
    "registry.terraform.io/hashicorp/aws" = ["4.0.0", "5.1.0", "5.50.0"]
  }
}

mock "tfplan/v2" {
  module {
    // Uses v4.x
    source = "../../mocks/check-provider-version/mock-tfplan-old-v2.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
