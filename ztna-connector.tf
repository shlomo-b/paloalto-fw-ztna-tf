# resource "aws_cloudformation_stack" "ztna_connector" {
#   name          = "ZTNA-Connector-Stack"
#   template_url  = var.template_url

#   parameters = {
#     InstanceName  = var.name[1]
#     IONKey        = var.IONKey
#     IONSecret     = var.IONSecret
#     MyVPC         = module.vpc["vpc1"].vpc_id
#     PublicSubnet = module.vpc["vpc1"].public_subnets[0]
#   }

#   capabilities = ["CAPABILITY_IAM"]
# }

# resource "aws_eip_association" "ztna_connector_eip_assoc" {
#   instance_id   = aws_cloudformation_stack.ztna_connector.outputs["InstanceId"]
#   allocation_id = aws_eip.ztna_connector_eip.id
# }

# resource "aws_eip" "ztna_connector_eip" {
#   domain = "vpc" # Required for EIP
# }
