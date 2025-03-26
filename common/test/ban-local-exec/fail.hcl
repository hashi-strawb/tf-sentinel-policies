mock "tfplan/v2" {
  module {
    source = "../../mocks/ban-local-exec/mock-tfplan-fail-v2.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
