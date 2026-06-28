# ===========================================
# Example : Huaweicloud Enterprise Project
# ===========================================
module "huaweicloud_enterprise_project_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/huaweicloud/enterprise_project"

  name        = "example"
  description = "Example enterprise project"
  type        = "prod"
}
