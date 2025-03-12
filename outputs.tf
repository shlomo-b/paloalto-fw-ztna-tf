# output "paloalto" {
#   value       = module.palo_alto_vm
#   description = "paloalto"
# }

output "ztna_connector_id" {
  value = aws_cloudformation_stack.ztna_connector
}