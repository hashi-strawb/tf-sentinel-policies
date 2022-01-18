policy "aws/mandatory-tags" {
  source = "./aws/enforce-mandatory-tags.sentinel"

  enforcement_level = "soft-mandatory"
}

policy "azure/mandatory-tags" {
  source = "./azure/enforce-mandatory-tags.sentinel"

  enforcement_level = "soft-mandatory"
}

policy "common/asteroids" {
  source = "./common/asteroids.sentinel"

  enforcement_level = "soft-mandatory"
}
