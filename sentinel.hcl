policy "aws/mandatory-tags" {
  source = "./aws/enforce-mandatory-tags.sentinel"

  enforcement_level = "soft-mandatory"
}

policy "azure/mandatory-tags" {
  source = "./azure/enforce-mandatory-tags.sentinel"

  enforcement_level = "soft-mandatory"
}

policy "common/check-tf-version" {
  source = "./common/check-tf-version.sentinel"

  enforcement_level = "advisory"
}

policy "common/ban-old-tf" {
  source = "./common/ban-old-tf.sentinel"

  enforcement_level = "soft-mandatory"
}

policy "common/check-provider-version" {
  source = "./common/check-provider-version.sentinel"

  enforcement_level = "advisory"
}
