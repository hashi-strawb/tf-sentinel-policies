# Test what happens when the "newest" version of TF is older than the version in-use
param "latest_override" {
  value = "1.0.2"
}

mock "tfplan/v2" {
  module {
    source = "../../mocks/check-tf-version/mock-tfplan-pass-v2.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
