mock "tfplan/v2" {
  module {
    source = "../../mocks/check-tf-version/mock-tfplan-fail-v2.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
