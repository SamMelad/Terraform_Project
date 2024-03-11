# This file contain all variables used in S3 file

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