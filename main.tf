module "vpc" {
  source = "./modules/vpc"
  cidr_block = "10.0.0.0/16"
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]
}

module "eks" {
  source           = "./modules/eks"
  cluster_name     = var.cluster_name
  vpc_id           = module.vpc.vpc_id
  public_subnets   = module.vpc.public_subnets
  private_subnets  = module.vpc.private_subnets
  node_group_iam_role = var.node_group_iam_role
  desired_capacity    = 3
  max_size            = 12
  min_size            = 3
  node_instance_type  = var.node_instance_type
}
