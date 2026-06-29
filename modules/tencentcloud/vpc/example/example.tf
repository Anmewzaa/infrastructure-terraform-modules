# ===========================================
# Example : TencentCloud VPC
# ===========================================
module "tencentcloud_vpc_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/tencentcloud/vpc"

  name       = "example-vpc"
  cidr_block = "10.0.0.0/16"
  dns_servers = ["119.29.29.29"]

  tags = {
    environment = "example"
  }
}
