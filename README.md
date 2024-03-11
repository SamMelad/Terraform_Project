# Terraform Project Documentation

## Overview

This project is a Terraform-based solution that consists of the following AWS resources:

- **EC2 instance**
- **S3 bucket**
- **DynamoDB table**

To use this project, you will need Terraform, an AWS account, and a code editor installed on your machine.

## Project Structure

The project is organized into several folders and files:

### Modules Folder

The Modules folder contains four sub-folders, each corresponding to a specific AWS resource:

1. **EC2**: Contains the EC2 module file and a variables file that defines all variables for the EC2 module.
2. **Network**: Contains the network module file and a variables file that defines all variables for the network module.
3. **DynamoDB**: Contains the DynamoDB module file and a variables file that defines all variables for the DynamoDB module.
4. **S3**: Contains the S3 module file and a variables file that defines all variables for the S3 module.

### Project1 Folder

The Project1 folder contains four files:

1. `main.tf`
2. `provider.tf`
3. `variable.tf`
4. `output.tf`

### Project2 Folder

The Project2 folder also contains four files:

1. `main.tf`
2. `provider.tf`
3. `variable.tf`
4. `output.tf`

The difference between the Project1 and Project2 folders is the region attribute in the `provider.tf` file, which allows the application to be deployed in more than one region.

## Module Details

Let's navigate through the module folders and files for a better explanation:

### Network Module

The network module defines these resources to cover all requirements:

1. `random_id`: Chooses random bytes. This is used for naming resources in the module.
2. `aws_vpc`: Creates a VPC for all resources that will be used in this project.
3. `aws_subnet`: Two resources are created from this one for the public subnet (used for the EC2 instance) and the private subnet (used for the DynamoDB table and S3 bucket).
4. `aws_internet_gateway`: Creates a gateway for the route table in the public subnet.
5. `aws_route_table`: Two resources are created from this one for the private subnet and the other for the public subnet.
6. `aws_network_acl`: Creates an access control list (ACL is a security level for the subnet).
7. `aws_network_acl_association`: Associates the created ACL and public subnet.
8. `aws_route_table_association`: Two resources are created from this one to link the route table with the public subnet, and the other for the private subnet.
9. `output`: At the end of the file, an output block refers to these values for `main.tf` in the project. This is used because these values will need to be passed to other modules in `main.tf` in the project.

### DynamoDB Module

The DynamoDB module defines these resources to cover all requirements:

1. `random_id`: Chooses random bytes. This is used for naming resources in the module.
2. `aws_dynamodb_table`: Creates a DynamoDB table.
3. `aws_vpc_endpoint`: Creates an endpoint for the DynamoDB table. In this resource, the VPC ID and route table for the private subnet that is created in the network module will be needed.
4. `output`: At the end of the file, an output block refers to these values for `main.tf` in the project. This is used because these values will need to be passed to other modules in `main.tf` in the project.

### S3 Module

The S3 module defines these resources to cover all requirements:

1. `random_id`: Chooses random bytes. This is used for naming resources in the module.
2. `aws_s3_bucket`: Creates a simple bucket and uses `random_id` for naming because the bucket name must be globally unique.
3. `aws_vpc_endpoint`: Creates an endpoint for the S3 bucket. In this resource, the VPC ID and route table for the private subnet that is created in the network module will be needed.
4. `output`: At the end of the file, an output block refers to these values for `main.tf` in the project. This is used because these values will need to be passed to other modules in `main.tf` in the project.

### EC2 Module

The EC2 module defines these resources to cover all requirements:

1. `random_id`: Chooses random bytes. This is used for naming resources in the module.
2. `aws_security_group`: Creates a security group rule for the created instance. The VPC ID that is created in the network module will be needed.
3. `aws_instance`: Creates an EC2 instance. The subnet ID for the public subnet will be needed.
4. `output`: At the end of the file, an output block refers to these values for `main.tf` in the project. This is used because these values will need to be passed to other modules in `main.tf` in the project.

## Project Folder

In the project folder, you will find the following files:

1. `main.tf`: This is the main file where modules are called. First, it calls the network module to create our VPC, subnets, and route tables. Then, it calls the DynamoDB module, S3 module, and finally the EC2 module. An additional attribute is used to create the DynamoDB and S3 first, then creates the EC2 instance. You will note this pattern `module.MODULE_NAME.OUTPUT_NAME` which passes output from one module to another.
2. `provider.tf`: This file is used to configure the provider and upload the state file to the S3 backend.
3. `variable.tf`: This file is used to declare the variables used in all modules' variables file.
4. `output.tf`: This file declares the outputs of the project, which appear after Terraform finishes.

### Installing and Running the Project

To install and run the project, follow these steps:

1. **Clone the repository** to your local machine:

    ```bash
    git clone https://github.com/SamMelad/Terraform_Project.git
    ```

2. **Navigate to the project directory**:

    ```bash
    cd Terraform_Project
    ```

3. **Initialize Terraform**:

    ```bash
    terraform init
    ```

    This command initializes your Terraform workspace by downloading the AWS provider and setting up the backend for storing your Terraform state.

4. **Create an execution plan**:

    ```bash
    terraform plan
    ```

    This command creates an execution plan and shows you what changes will be made to your infrastructure.

5. **Apply the changes**:

    ```bash
    terraform apply
    ```

    This command applies the changes required to reach the desired state of the configuration.

That's it! You have now successfully deployed the project on your AWS account.
