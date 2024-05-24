mock "tfplan/v2" {
  module {
    source = "../../mocks/check-provider-version/mock-tfplan-unpinned-v2.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}

