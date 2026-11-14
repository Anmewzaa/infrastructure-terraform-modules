# ===========================================
# Example : Azurerm Redis Cache
# ===========================================
module "azurerm_redis_cache_example" {
  source = "git::https://github.com/Anmewzaa/infrastructure-terraform-modules//modules/azure/redis_cache"

  name                = "example-redis"
  resource_group_name = "example"

  tags = {
    "project" : "example"
  }
}
