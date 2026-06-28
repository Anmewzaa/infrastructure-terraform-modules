# ===========================================
# Resource : Azurerm Virtual Machine
# ===========================================
resource "azurerm_network_interface" "this" {
  name                = "${var.name}-nic"
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_address_allocation
    private_ip_address            = var.private_ip_address
    public_ip_address_id          = var.public_ip_address_id
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "this" {
  count = var.os_type == "Linux" ? 1 : 0

  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  size                = var.size
  admin_username      = var.admin_username

  network_interface_ids = [azurerm_network_interface.this.id]

  disable_password_authentication = var.disable_password_authentication
  admin_password                  = var.admin_password

  dynamic "admin_ssh_key" {
    for_each = var.admin_ssh_public_key != null ? [1] : []

    content {
      username   = var.admin_username
      public_key = var.admin_ssh_public_key
    }
  }

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb         = var.os_disk_size_gb
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }

  custom_data = var.custom_data

  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []

    content {
      type         = var.identity_type
      identity_ids = contains(["UserAssigned", "SystemAssigned, UserAssigned"], var.identity_type) ? var.identity_ids : null
    }
  }

  tags = var.tags
}

resource "azurerm_windows_virtual_machine" "this" {
  count = var.os_type == "Windows" ? 1 : 0

  name                = var.name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  size                = var.size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  network_interface_ids = [azurerm_network_interface.this.id]

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_account_type
    disk_size_gb         = var.os_disk_size_gb
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }

  custom_data = var.custom_data

  dynamic "identity" {
    for_each = var.identity_type != null ? [1] : []

    content {
      type         = var.identity_type
      identity_ids = contains(["UserAssigned", "SystemAssigned, UserAssigned"], var.identity_type) ? var.identity_ids : null
    }
  }

  tags = var.tags
}
