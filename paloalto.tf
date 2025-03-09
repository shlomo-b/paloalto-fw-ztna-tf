# # search the vm on marketplace
# # update the vmseries_ami_id
# # update the vmseries_version
# # update the vmseries_product_code

# module "palo_alto_vm" {
#   source  = "PaloAltoNetworks/swfw-modules/aws//modules/vmseries"
#   version = "3.0.0-rc.1"
#   name = var.name
#   instance_type = var.instance_type[0]
#   ssh_key_name = "TF-key"
#   vmseries_product_code = var.vmseries_product_code
#   vmseries_ami_id = "ami-01baf651a96150d84"
#   vmseries_version = var.vmseries_version
#   interfaces = {
#     mgmt = {
#       device_index       = 0
#       subnet_id          = module.vpc.public_subnets[0]
#       name               = "mgmt"
#       create_public_ip   = true
#       source_dest_check  = true
#       security_group_ids = [aws_security_group.Allow_services.id]  
#     },
#     public = {
#       device_index       = 1
#       subnet_id          = module.vpc.public_subnets[0]
#       name               = "public"
#       create_public_ip   = false
#       source_dest_check  = true
#       security_group_ids = [aws_security_group.Allow_services.id]
#     },
#     private = {
#       device_index       = 2
#       subnet_id          =  module.vpc.private_subnets[0]
#       name               = "private"
#       source_dest_check  = true
#       create_public_ip   = false
#       security_group_ids = [aws_security_group.Allow_services.id]
#   }
# }
# }