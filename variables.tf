#---------------region-------------------#

variable "aws_region" {
  default = ["eu-central-1", "us-east-1"]
  type    = list(string)
}

#---------------vpcs------------------#

variable "vpcs" {
  type = map(object({
    cidr            = string
    private_subnets = list(string)
    public_subnets  = list(string)
    azs             = list(string)
    tags            = map(string)
  }))
}

#---------------ztna------------------#
variable "ztnas" {
  type = map(object({
    IONKey         = string
    InstanceName   = string
    IONSecret      = string
    vpc_key        = string
    MyVPC          = string
    PublicSubnet   = string
    tags           = map(string)
  }))
}

#---------------name------------------#

variable "name" {
  default = "PaloAlto"
  type    = string
}

#---------------vmseries_version------------------#

variable "vmseries_version" {
  default = "11.1.4-h7"
  type    = string
}
#---------------instance_type------------------#

variable "instance_type" {
  default = ["m4.xlarge", "t2.small", "t2.micro", "t2.medium"]
  type    = list(string)
}


#---------------keys------------------#

# variable "IONKey" {
#   default = "value"
#   type    = string
# }

# variable "IONSecret" {
#   default = "value"
#   type    = string
# }

#---------------vmseries_product_code------------------#

variable "vmseries_product_code" {
  default = "locals.vmseries_product_code"
  type    = string
}

#---------------template url------------------#

# variable "template_url1" {
#   default = "https://s3.amazonaws.com/awsmp-fulfillment-cf-templates-prod/c531b556-fc22-4f3e-aea6-4553f50ff77b/411852c8e5f941cf8f072e94eb48e49d.template"
#   type    = string
# }


variable "template_url" {
  default = "https://s3.amazonaws.com/shlomo-project-ci-cd/templates/cf-stack.template"
  type    = string
}

