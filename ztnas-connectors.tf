resource "aws_eip" "ztna_connector_eip" {
  domain = "vpc"
}

resource "aws_cloudformation_stack" "ztna_connector" {
  for_each = var.ztnas 

  name          = each.key
  template_url  = var.template_url

  parameters = {
    InstanceName  = each.value.InstanceName
    IONKey        = each.value.IONKey
    IONSecret     = each.value.IONSecret
    MyVPC         = module.vpc[each.value.vpc_key].vpc_id
    PublicSubnet  = data.aws_subnet.public[each.key].id
  }

  capabilities = ["CAPABILITY_IAM"]
}


resource "aws_eip_association" "ztna_connector_eip_assoc" {
  for_each = aws_cloudformation_stack.ztna_connector

  instance_id   = each.value.outputs["InstanceId"]
  allocation_id = aws_eip.ztna_connector_eip.id
  depends_on = [ aws_cloudformation_stack.ztna_connector ]
}

data "aws_subnet" "public" {
  for_each = var.ztnas
  
  vpc_id = module.vpc[each.value.vpc_key].vpc_id
  
  filter {
    name   = "cidr-block"
    values = [each.value.PublicSubnet]
  }
}