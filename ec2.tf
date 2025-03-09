# module "ec2" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version                = "~> 2.0"

#   name                   = "linux"
#   ami                    = data.aws_ami.amazon-linux.id
#   instance_type          = var.instance_type[1]
#   subnet_id              = module.vpc.private_subnets[0]
#   vpc_security_group_ids = [aws_security_group.Allow_services.id]
#   monitoring             = true
#   key_name = "TF-key"
  
# }

# # Get latest Amazon Linux 2 AMI
# data "aws_ami" "amazon-linux" {
#   most_recent = true
#   owners      = ["amazon"]
#   filter {
#     name   = "name"
#     values = ["amzn2-ami-hvm*"]
#   }
# }
