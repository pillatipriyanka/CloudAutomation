provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./terraform-modules/vpc"
  # Add variables as needed
}

module "subnet" {
  source           = "./terraform-modules/subnet"
  vpc_id           = module.vpc.vpc_id
  cidr_block       = var.subnet_cidr_block
  availability_zone = var.subnet_az
  map_public_ip_on_launch = true
  tags             = var.tags
}

module "security_group" {
  source        = "./terraform-modules/security-group"
  name          = "example-sg"
  vpc_id        = module.vpc.vpc_id
  ingress       = var.sg_ingress
  egress        = var.sg_egress
  tags          = var.tags
}

module "ec2" {
  source            = "./terraform-modules/ec2"
  ami               = var.ec2_ami
  instance_type     = var.ec2_instance_type
  subnet_id         = module.subnet.subnet_id
  security_group_ids = [module.security_group.security_group_id]
  name              = "example-ec2"
}

module "s3" {
  source      = "./terraform-modules/s3"
  bucket_name = var.s3_bucket_name
  acl         = "private"
  tags        = var.tags
}

module "ecr" {
  source             = "./terraform-modules/ecr"
  repository_name    = var.ecr_repository_name
  image_tag_mutability = "MUTABLE"
  tags               = var.tags
}

module "lambda" {
  source                = "./terraform-modules/lambda"
  function_name         = var.lambda_function_name
  handler               = var.lambda_handler
  runtime               = var.lambda_runtime
  role_arn              = var.lambda_role_arn
  filename              = var.lambda_filename
  environment_variables = var.lambda_env
}

module "dynamodb" {
  source        = "./terraform-modules/dynamodb"
  table_name    = var.dynamodb_table_name
  billing_mode  = "PAY_PER_REQUEST"
  hash_key      = var.dynamodb_hash_key
  hash_key_type = "S"
  tags          = var.tags
}

module "autoscaling" {
  source               = "./terraform-modules/autoscaling"
  name                 = var.autoscaling_group_name
  max_size             = var.autoscaling_max_size
  min_size             = var.autoscaling_min_size
  desired_capacity     = var.autoscaling_desired_capacity
  launch_configuration = var.autoscaling_launch_configuration
  subnet_ids           = [module.subnet.subnet_id]
  tags                 = var.tags
}

module "vpn" {
  source = "./terraform-modules/vpn"
  vpc_id = module.vpc.vpc_id
  tags   = var.tags
}

module "step_functions" {
  source         = "./terraform-modules/step-functions"
  name           = var.step_functions_name
  role_arn       = var.step_functions_role_arn
  definition_path = var.step_functions_definition_path
  type           = "STANDARD"
}