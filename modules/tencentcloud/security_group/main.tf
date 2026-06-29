# ===========================================
# Resource : TencentCloud Security Group
# ===========================================
resource "tencentcloud_security_group" "this" {
  name        = var.name
  description = var.description
  project_id  = var.project_id

  tags = var.tags
}

resource "tencentcloud_security_group_rule_set" "this" {
  count = length(var.ingress_rules) > 0 || length(var.egress_rules) > 0 ? 1 : 0

  security_group_id = tencentcloud_security_group.this.id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      action                  = ingress.value.action
      cidr_block              = ingress.value.cidr_block
      ipv6_cidr_block         = ingress.value.ipv6_cidr_block
      source_security_id      = ingress.value.source_security_id
      protocol                = ingress.value.protocol
      port                    = ingress.value.port
      address_template_id     = ingress.value.address_template_id
      address_template_group  = ingress.value.address_template_group
      service_template_id     = ingress.value.service_template_id
      service_template_group  = ingress.value.service_template_group
      description             = ingress.value.description
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules
    content {
      action                  = egress.value.action
      cidr_block              = egress.value.cidr_block
      ipv6_cidr_block         = egress.value.ipv6_cidr_block
      source_security_id      = egress.value.source_security_id
      protocol                = egress.value.protocol
      port                    = egress.value.port
      address_template_id     = egress.value.address_template_id
      address_template_group  = egress.value.address_template_group
      service_template_id     = egress.value.service_template_id
      service_template_group  = egress.value.service_template_group
      description             = egress.value.description
    }
  }
}
