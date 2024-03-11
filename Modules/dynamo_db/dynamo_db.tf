# Choosing randam numbers for naming 
resource "random_id" "id" {
  byte_length = 1
}


# Creating dynamodb table 
resource "aws_dynamodb_table" "my_dynamodb" {
  name = var.dyanmo-name   
  hash_key = var.hash         
  read_capacity  = var.read-cap   
  write_capacity = var.write_cap

  # I specified only one attribute , But you can do more
  attribute {
    name = var.attr_name
    type = var.attr_type
  }

  # Creating tag name for dynamodb
  tags = {
    Name = "dynamodb-table-${random_id.id.hex}"
  }
}


# Creating endpoint for dynamodb table in private subnet for security
resource "aws_vpc_endpoint" "dynamo_db_endpoint" {
  vpc_id = var.vpc    
  service_name = "com.amazonaws.${var.region}.dynamodb"
  vpc_endpoint_type = "Gateway"   

  # Private route table will be referred from network module to create endpoint in private subnet
  route_table_ids= [ var.private_route_table ]    

  tags = {
    Name = "Dynamodb-Endpoint-${random_id.id.hex}"
  }
}


# This output to refer dynamodb table id at the end
output "Dynamo_db" {
  value = aws_dynamodb_table.my_dynamodb.id
}

# This output to refer dynamodb table endpoint id at the end
output "dynamo_db_endpoint" {
  value = aws_vpc_endpoint.dynamo_db_endpoint.id
}