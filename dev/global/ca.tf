resource "aws_acmpca_certificate_authority" "dev_ca" {
  certificate_authority_configuration {
    key_algorithm     = "RSA_2048"
    signing_algorithm = "SHA256WITHRSA"

    subject {
      common_name         = "SRE Techy Soultions"
      organization        = "SRE Tech"
      organizational_unit = "Devops"
      country             = "IN"
      locality            = "INDIA"
      state               = "ANDHRA"
    }
  }
}

