mock "tfplan/v2" {
  module {
    source = "../../mocks/ban-local-exec/mock-tfplan-pass-v2.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
