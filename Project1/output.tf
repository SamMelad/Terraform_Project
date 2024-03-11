# This file contain the outputs to see id for each service created

output "VPC" {
  value = module.network-module.vpc
}

output "Public_Subnet" {
  value = module.network-module.public
}

output "Private_Subnet" {
  value = module.network-module.private
}

output "ACL_For_Public_Subnet" {
  value = module.network-module.acl
}

output "Dynamo_db" {
  value = module.dynamodb-module.Dynamo_db
}

output "S3_Bucket" {
  value = module.S3-module.s3
}

output "EC2_Instance" {
  value = module.EC2-module.EC2
}

output "Security_Group_For_Ec2_Instance" {
  value = module.EC2-module.SG
}

output "S3_Endpoint" {
  value = module.S3-module.s3_endpoint
}

output "Dynamodb_Endpoint" {
  value = module.dynamodb-module.dynamo_db_endpoint
}