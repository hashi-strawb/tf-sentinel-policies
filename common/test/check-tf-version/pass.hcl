# Set a fixed "latest" version, so I don't have to keep updating my tests
param "latest_override" {
  value = "1.3.2"
}

mock "tfplan/v2" {
  module {
    source = "../../mocks/mock-tfplan-pass-v2.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
