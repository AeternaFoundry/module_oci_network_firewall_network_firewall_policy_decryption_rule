variable "network_firewall_network_firewall_policy_decryption_rules" {
  description = <<EOT
Map of network_firewall_network_firewall_policy_decryption_rules, attributes below
Required:
    - action
    - name
    - network_firewall_policy_id
    - condition (block):
        - destination_address (optional)
        - source_address (optional)
Optional:
    - decryption_profile
    - description
    - priority_order
    - secret
    - secrets
    - position (block):
        - after_rule (optional)
        - before_rule (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    action                     = string
    name                       = string
    network_firewall_policy_id = string
    decryption_profile         = optional(string)
    description                = optional(string)
    priority_order             = optional(string)
    secret                     = optional(string)
    secrets                    = optional(list(string))
    condition = object({
      destination_address = optional(list(string))
      source_address      = optional(list(string))
    })
    position = optional(object({
      after_rule  = optional(string)
      before_rule = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
}

