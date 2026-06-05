module "vpc" {
  source              = "../../modules/vpc"
  env_name            = "staging"
  vpc_cidr            = "10.1.0.0/16"
  public_subnet_cidr  = "10.1.1.0/24"
  private_subnet_cidr = "10.1.2.0/24"
  az                  = "us-east-1a"
  project_name        = "task-manager"
}

module "security_groups" {
  source   = "../../modules/security_groups"
  env_name = "staging"
  vpc_id   = module.vpc.vpc_id
  your_ip  = var.your_ip 

  
}

module "ec2" {
  source            = "../../modules/ec2"
  env_name          = "staging"
  public_subnet_id  = module.vpc.public_subnet_id
  key_name          = var.key_name
  app_sg_id         = module.security_groups.app_sg_id
}