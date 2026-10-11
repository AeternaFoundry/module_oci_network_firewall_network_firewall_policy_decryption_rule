resource "oci_network_firewall_network_firewall_policy_decryption_rule" "network_firewall_network_firewall_policy_decryption_rules" {
  for_each = var.network_firewall_network_firewall_policy_decryption_rules

  action                     = each.value.action
  name                       = each.value.name
  network_firewall_policy_id = each.value.network_firewall_policy_id
  decryption_profile         = each.value.decryption_profile
  description                = each.value.description
  priority_order             = each.value.priority_order
  secret                     = each.value.secret
  secrets                    = each.value.secrets

  condition {
    destination_address = each.value.condition.destination_address
    source_address      = each.value.condition.source_address
  }

  dynamic "position" {
    for_each = each.value.position != null ? [each.value.position] : []
    content {
      after_rule  = position.value.after_rule
      before_rule = position.value.before_rule
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

