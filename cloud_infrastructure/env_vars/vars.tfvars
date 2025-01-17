aws_region  = "ap-south-1"

vpc_cidr = "10.1.0.0/16"
public_subnet_cidr = [
  {
    cidr = "10.1.0.0/19"
    az   = "ap-south-1a"
  },
  {
    cidr = "10.1.32.0/19"
    az   = "ap-south-1b"
  },
  {
    cidr = "10.1.64.0/19"
    az   = "ap-south-1c"
  }
]

private_subnet_cidr = [
  {
    cidr = "10.1.96.0/19"
    az   = "ap-south-1a"
  },
  {
    cidr = "10.1.128.0/19"
    az   = "ap-south-1b"
  },
  {
    cidr = "10.1.160.0/19"
    az   = "ap-south-1c"
  }
]
