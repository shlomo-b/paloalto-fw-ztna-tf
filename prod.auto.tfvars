#---------------vpcs------------------#

vpcs = {
  vpc1 = {
    cidr            = "10.90.0.0/16"
    private_subnets = ["10.90.1.0/24"]
    public_subnets  = ["10.90.2.0/24"]
    azs             = ["us-east-1a","us-east-1b"]
    tags = {
      name = "vpc-one"
    }
  }
  vpc2 = {
    cidr            =  "10.91.0.0/16"
    private_subnets = ["10.91.1.0/24"]
    public_subnets  = ["10.91.2.0/24"]
    azs             = ["us-east-1a","us-east-1b"]
    tags = {
      name = "vpc-two"
    }
  }
}

#---------------ztnas------------------#

ztnas = {
  ztna1 = {
    InstanceName = "ZTNA-Connector-1"
    vpc_key     = "vpc1"
    IONKey       = "your key"
    IONSecret    = "your secret"
    MyVPC        = "vpc1"
    PublicSubnet = "10.90.2.0/24"
    tags = {
      name = "ztna1"
    }
  }
  ztna2 = {
    InstanceName = "ZTNA-Connector-2"
    vpc_key     = "vpc2"
    IONKey       = "your key"
    IONSecret    = "your secret"
    MyVPC        = "vpc2"
    PublicSubnet = "10.91.2.0/24"
    tags = {
      name = "ztna2"
    }
  }
}
