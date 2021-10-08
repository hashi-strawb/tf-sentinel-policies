policy "aws-advise-mandatory-tags" {
  source = "./aws/enforce-mandatory-tags.sentinel"
  source = "https://raw.githubusercontent.com/hashicorp/terraform-foundational-policies-library/master/cis/aws/networking/aws-cis-4.1-networking-deny-public-ssh-acl-rules/aws-cis-4.1-networking-deny-public-ssh-acl-rules.sentinel"

  enforcement_level = "soft-mandatory"
}
