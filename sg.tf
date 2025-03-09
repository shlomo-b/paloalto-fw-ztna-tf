resource "aws_security_group" "Allow_services" {
  name        = "PROD"
  description = "global rule"
  vpc_id      = module.vpc["vpc-one"].vpc_id

  ingress {
    description = "All traffic_in"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["84.228.161.67/32"]
  }
   ingress {
    description = "All traffic_in"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["100.92.0.0/16"]
  }
  egress {
    description = "All traffic_out"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "Allow_services_2" {
  name        = "PROD"
  description = "global rule"
  vpc_id      = module.vpc["vpc-two"].vpc_id

  ingress {
    description = "All traffic_in"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["84.228.161.67/32"]
  }
   ingress {
    description = "All traffic_in"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["100.92.0.0/16"]
  }
  egress {
    description = "All traffic_out"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}