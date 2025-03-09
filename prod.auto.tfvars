#---------------vpcs------------------#

vpcs = {
  vpc-one = {
    cidr            = "10.90.0.0/16"
    private_subnets = ["10.90.1.0/24"]
    public_subnets  = ["10.90.2.0/24"]
    azs             = ["us-east-1a","us-east-1b"]
    tags = {
      name = "vpc-one"
    }
  }
  vpc-two = {
    cidr            =  "10.91.0.0/16"
    private_subnets = ["10.91.1.0/24"]
    public_subnets  = ["10.91.2.0/24"]
    azs             = ["us-east-1a","us-east-1b"]
    tags = {
      name = "vpc-two"
    }
  }
}
