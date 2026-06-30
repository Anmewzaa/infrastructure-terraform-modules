# ===========================================
# Example : TencentCloud Security Group
# ===========================================
module "tencentcloud_security_group_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/tencentcloud/security_group"

  name        = "example-sg"
  description = "Example security group"

  ingress_rules = [
    {
      action      = "ACCEPT"
      cidr_block  = "10.0.0.0/16"
      protocol    = "TCP"
      port        = "22,443"
      description = "Allow SSH and HTTPS from internal network"
    }
  ]

  egress_rules = [
    {
      action      = "ACCEPT"
      cidr_block  = "0.0.0.0/0"
      protocol    = "ALL"
      port        = "all"
      description = "Allow all outbound traffic"
    }
  ]
}
