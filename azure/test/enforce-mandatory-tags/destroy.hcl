# https://github.com/lucymhdavies/learn-sentinel-tfc
# but with a few extra tags

mock "tfplan/v2" {
  module {
    source = "../../mocks/mock-tfplan-destroy-v2.sentinel"
  }
}

test {
  rules = {
    main = true
  }
}
