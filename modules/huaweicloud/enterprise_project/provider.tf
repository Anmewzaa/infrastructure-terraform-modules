# ===========================================
# Provider : huaweicloud
# ===========================================
terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = "~>1.0"
    }
  }
}

provider "huaweicloud" {}
