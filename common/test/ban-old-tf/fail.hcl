mock "tfplan/v2" {
  module {
    source = "../../mocks/ban-old-tf/mock-tfplan-fail-v2.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
