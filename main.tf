module "vpc" {
  source      = "./modules/vpc"
  cidr_block  = "10.0.0.0/16"
  subnet_cidr = "10.0.1.0/24"
}

module "Ec2" {
  source        = "./modules/Ec2"
  ami           = "ami-04c913012f8977029" 
  #Name          = "Ramya-Ec2"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.subnet_id
  vpc_id = module.vpc.vpc_id  
  
}

module "ebs"{
  source = "./modules/EBS"
  instance_id = module.Ec2.instance_id
  availability_zone  =  module.vpc.az

   }