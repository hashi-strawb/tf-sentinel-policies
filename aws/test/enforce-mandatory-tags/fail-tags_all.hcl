# https://github.com/lucymhdavies/nomad-aws

mock "tfplan/v2" {
  module {
    source = "../../mocks/mock-tfplan-fail-tags_all-v2.sentinel"
  }
}

test {
  rules = {
    main = false
  }
}
