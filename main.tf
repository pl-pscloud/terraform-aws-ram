

resource "aws_ram_resource_share" "pscloud-ram-resource-share" {
  name                      = "${var.pscloud_company}_ram_${var.pscloud_purpose}_${var.pscloud_env}"
  allow_external_principals = true

  tags = {
    Environment = "${var.pscloud_company}_ram_${var.pscloud_purpose}_${var.pscloud_env}"
  }
}

resource "aws_ram_resource_association" "pscloud-ram-resource-association" {
  resource_arn       = var.pscloud_resource_arn
  resource_share_arn = aws_ram_resource_share.pscloud-ram-resource-share.arn
}

resource "aws_ram_principal_association" "pscloud-ram-principal-association" {
  principal          = var.pscloud_account_id
  resource_share_arn = aws_ram_resource_share.pscloud-ram-resource-share.arn
}

