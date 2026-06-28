# infrastructure-terraform-modules

### azurerm

| Module                           | Description                                                      | Example                                        |
| --------------------------------- | ------------------------------------------------------------------ | ------------------------------------------------ |
| `azurerm_resource_group`         | Module for creating Azure Resource Groups                        | [Link](./modules/azure/resource_group)         |
| `azurerm_virtual_network`        | Module for creating Azure Virtual Networks                       | [Link](./modules/azure/virtual_network)        |
| `azurerm_network_security_group` | Module for creating Azure Network Security Group                 | [Link](./modules/azure/network_security_group) |
| `azurerm_route_table`            | Module for creating Azure Route Table                             | [Link](./modules/azure/route_table)            |
| `azurerm_user_assigned_identity` | Module for creating Azure User Assigned Identity                 | [Link](./modules/azure/user_assigned_identity) |
| `azurerm_private_dns_zone`       | Module for creating Azure Private DNS Zone                       | [Link](./modules/azure/private_dns_zone)       |
| `azurerm_storage_account`        | Module for creating Azure Storage Account                        | [Link](./modules/azure/storage_account)        |
| `azurerm_role_assignment`        | Module for creating Azure Role Assignment                        | [Link](./modules/azure/role_assignment)        |
| `azurerm_private_endpoint`       | Module for creating Azure Private Endpoint                       | [Link](./modules/azure/private_endpoint)       |
| `azurerm_key_vault`              | Module for creating Azure Key Vault                               | [Link](./modules/azure/key_vault)              |
| `azurerm_cognitive_account`      | Module for creating Azure Cognitive Services Account              | [Link](./modules/azure/cognitive_account)      |
| `azurerm_virtual_machine`        | Module for creating Azure Virtual Machines (Linux or Windows)    | [Link](./modules/azure/virtual_machine)        |
| `azurerm_kubernetes_cluster`     | Module for creating Azure Kubernetes Service (with KMS support)  | [Link](./modules/azure/kubernetes_cluster)     |

### huaweicloud

| Module                              | Description                                       | Example                                              |
| ----------------------------------- | -------------------------------------------------- | ------------------------------------------------------ |
| `huaweicloud_enterprise_project`    | Module for creating Huawei Cloud Enterprise Projects | [Link](./modules/huaweicloud/enterprise_project)    |
