policy "aws-advise-mandatory-tags" {
  source = "./aws/enforce-mandatory-tags.sentinel"

  enforcement_level = "advisory"
}
