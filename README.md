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
| `azurerm_service_plan`           | Module for creating Azure App Service Plans                       | [Link](./modules/azure/service_plan)           |
| `azurerm_linux_web_app`          | Module for creating Azure Linux Web Apps                         | [Link](./modules/azure/linux_web_app)          |
| `azurerm_container_registry`     | Module for creating Azure Container Registry (ACR)               | [Link](./modules/azure/container_registry)     |
| `azurerm_log_analytics_workspace`| Module for creating Azure Log Analytics Workspaces               | [Link](./modules/azure/log_analytics_workspace)|
| `azurerm_application_insights`   | Module for creating Azure Application Insights components        | [Link](./modules/azure/application_insights)   |
| `azurerm_mssql_server`           | Module for creating Azure SQL Server (MSSQL)                     | [Link](./modules/azure/mssql_server)           |
| `azurerm_mssql_database`         | Module for creating Azure SQL Database (MSSQL)                   | [Link](./modules/azure/mssql_database)         |
| `azurerm_postgresql_flexible_server` | Module for creating Azure PostgreSQL Flexible Server         | [Link](./modules/azure/postgresql_flexible_server) |
| `azurerm_mysql_flexible_server`  | Module for creating Azure MySQL Flexible Server                  | [Link](./modules/azure/mysql_flexible_server)  |
| `azurerm_cosmosdb_account`       | Module for creating Azure Cosmos DB Account                      | [Link](./modules/azure/cosmosdb_account)       |
| `azurerm_servicebus_namespace`   | Module for creating Azure Service Bus Namespace                  | [Link](./modules/azure/servicebus_namespace)   |
| `azurerm_servicebus_queue`       | Module for creating Azure Service Bus Queue                      | [Link](./modules/azure/servicebus_queue)       |
| `azurerm_servicebus_topic`       | Module for creating Azure Service Bus Topic                      | [Link](./modules/azure/servicebus_topic)       |
| `azurerm_eventhub_namespace`     | Module for creating Azure Event Hub Namespace                    | [Link](./modules/azure/eventhub_namespace)     |
| `azurerm_eventhub`               | Module for creating Azure Event Hub                              | [Link](./modules/azure/eventhub)               |
| `azurerm_eventgrid_topic`        | Module for creating Azure Event Grid Topic                       | [Link](./modules/azure/eventgrid_topic)        |
| `azurerm_public_ip`              | Module for creating Azure Public IP Addresses                    | [Link](./modules/azure/public_ip)              |
| `azurerm_nat_gateway`            | Module for creating Azure NAT Gateways                           | [Link](./modules/azure/nat_gateway)            |
| `azurerm_lb`                     | Module for creating Azure Load Balancers                         | [Link](./modules/azure/lb)                     |
| `azurerm_application_gateway`    | Module for creating Azure Application Gateways                   | [Link](./modules/azure/application_gateway)    |
| `azurerm_firewall`               | Module for creating Azure Firewalls                              | [Link](./modules/azure/firewall)               |
| `azurerm_bastion_host`           | Module for creating Azure Bastion Hosts                          | [Link](./modules/azure/bastion_host)           |
| `azurerm_subscription_policy_assignment` | Module for assigning Azure Policy at Subscription scope  | [Link](./modules/azure/subscription_policy_assignment) |
| `azurerm_monitor_action_group`   | Module for creating Azure Monitor Action Groups                  | [Link](./modules/azure/monitor_action_group)   |
| `azurerm_monitor_metric_alert`   | Module for creating Azure Monitor Metric Alerts                  | [Link](./modules/azure/monitor_metric_alert)   |

### huaweicloud

| Module                              | Description                                       | Example                                              |
| ----------------------------------- | -------------------------------------------------- | ------------------------------------------------------ |
| `huaweicloud_enterprise_project`    | Module for creating Huawei Cloud Enterprise Projects | [Link](./modules/huaweicloud/enterprise_project)    |

### gcp

| Module                       | Description                                                   | Example                                       |
| ----------------------------- | --------------------------------------------------------------- | ------------------------------------------------ |
| `google_compute_network`    | Module for creating GCP VPC Networks and Subnetworks         | [Link](./modules/gcp/compute_network)         |
| `google_compute_firewall`   | Module for creating GCP Firewall Rules                        | [Link](./modules/gcp/compute_firewall)        |

### tencentcloud

| Module                              | Description                                                        | Example                                              |
| ------------------------------------ | --------------------------------------------------------------------- | ------------------------------------------------------ |
| `tencentcloud_vpc`                  | Module for creating Tencent Cloud VPCs                             | [Link](./modules/tencentcloud/vpc)                  |
| `tencentcloud_security_group`       | Module for creating Tencent Cloud Security Groups (with ordered rule set) | [Link](./modules/tencentcloud/security_group)       |
