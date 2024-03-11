# This file contain all variables used in dynamodb module


variable "dyanmo-name" {
  description = "DynamoDB name"
  type = string
}

variable "read-cap" {
  description = "Read Capacity"
  type = number
}

variable "write_cap" {
  description = "Write Capacity"
  type = number
}

variable "hash" {
  description = "Hash Key for DB"
  type = string
}

variable "attr_name" {
  description = "Attribute Name"
  type = string
}

variable "attr_type" {
  description = "Attribute Type"
  type = string
}


variable "vpc" {
  description = "VPC ID"
  type = string
}


variable "region" {
  description = "Region"
  type = string
}


variable "private_route_table" {
  description = "Private Route Table"
  type = string
}