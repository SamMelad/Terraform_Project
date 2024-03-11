# Choosing randam numbers for naming 
resource "random_id" "id" {
  byte_length = 2
}

# Creating bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-project-bucket-${random_id.id.hex}"

  tags = {
    Name = "my-project-bucket"
  }
}


# Creating endpoint for S3 bucket in private subnet for security
resource "aws_vpc_endpoint" "s3" {
  vpc_id            = var.vpc
  service_name      = "com.amazonaws.${var.region}.s3"
  vpc_endpoint_type = "Gateway"

  # Private route table will be referred from network module to create endpoint in private subnet
  route_table_ids= [ var.private_route_table ]

  tags = {
    Name = "S3-Endpoint-${random_id.id.hex}"
  }
}

# This output to refer S3 bucket id at the end
output "s3" {
  value = aws_s3_bucket.my_bucket.id
}

# This output to refer S3 bucket endpoint id at the end
output "s3_endpoint" {
  value = aws_vpc_endpoint.s3.id
}