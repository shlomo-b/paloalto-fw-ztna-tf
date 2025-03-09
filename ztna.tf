# resource "aws_eip" "ztna_connector_eip" {
#   domain = "vpc"
# }

# resource "aws_cloudformation_stack" "ztna_connector" {
#   for_each = var.ztna  

#   name          = each.key
#   template_url  = var.template_url

#   parameters = {
#     InstanceName  = "ZTNA-Connector-1"
#     IONKey        = each.value.IONKey
#     IONSecret     = each.value.IONSecret
#     MyVPC         = each.value.MyVPC
#     PrivateSubnet = each.value.PrivateSubnet
#   }

#   capabilities = ["CAPABILITY_IAM"]
# }

# output "ztna_connector_id" {
#   value = aws_cloudformation_stack.ztna_connector
# }

# resource "aws_eip_association" "ztna_connector_eip_assoc" {
#   instance_id   = aws_cloudformation_stack.ztna_connector.outputs["InstanceId"]
#   allocation_id = aws_eip.ztna_connector_eip.id
# }

