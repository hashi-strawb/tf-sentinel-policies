mock "tfplan/v2" {
  module {
    source = "../../mocks/ban-old-tf/mock-tfplan-pass-v2.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
