module "alb" {
  source                     = "./modules/alb"
  prefix                     = var.prefix
  vpc_id                     = var.vpc_id
  internal                   = var.internal
  alb_subnets                = var.alb_subnets
  enable_deletion_protection = var.enable_deletion_protection
  access_logs_bucket         = var.access_logs_bucket
  access_logs_prefix         = var.access_logs_prefix
  aws_account_id             = var.aws_account_id
  target_group_name          = var.target_group_name
  target_group_port          = var.target_group_port
  health_check_path          = var.health_check_path
}

module "endpoint" {
  source          = "./modules/endpoint"
  vpc_id          = var.vpc_id
  region          = var.region
  subnet_ids      = var.subnet_ids
  route_table_ids = var.route_table_ids
  prefix          = var.prefix
}

module "eks" {
  source                   = "./modules/eks"
  environment = var.environment
  Account_ID               = var.Account_ID
  vpc_id                   = var.vpc_id
  prefix                   = var.prefix
  max_unavailable          = var.max_unavailable
  cluster_name             = var.cluster_name
  cluster_version          = var.cluster_version
  subnet_ids               = var.subnet_ids
  enable_cluster_log_types = var.enable_cluster_log_types
  desired_size             = var.desired_size
  max_size                 = var.max_size
  min_size                 = var.min_size
  iam_roles                = var.iam_roles
}

module "efs" {
  source               = "./modules/efs"
  environment = var.environment
  vpc_id               = var.vpc_id
  subnet_ids           = var.subnet_ids
  efs_performance_mode = var.efs_performance_mode
  efs_throughput_mode  = var.efs_throughput_mode
}

module "nlb-alb" {
  source     = "./modules/nlb-alb"
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids
}

module "ec2" {
  source                  = "./modules/ec2"
  environment            = var.environment
  server_name             = var.server_name
  vpc_id                  = var.vpc_id
  instance_type           = var.instance_type
  subnet_id               = var.subnet_id
  root_block_device       = var.root_block_device
  persistent_block_device = var.persistent_block_device
  ec2_key_name            = var.ec2_key_name
  prefix                  = var.prefix
  private_ips             = var.private_ips
  os_type = var.os_type
}