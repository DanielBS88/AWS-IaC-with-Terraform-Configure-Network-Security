# AWS-IaC-with-Terraform-Configure-Network-Security
Me ajude a resolver o problema abaixo, passo a passo. Estou linux e preciso gerar os files em terraform para revolver o problema abaixo. Logo me de os passos de como conectar no meu git respositorio e comitar.

Lab Description
The objective of this lab is to create and configure AWS Identity and Access Management (IAM) resources using Terraform. This includes setting up an IAM group, creating a custom policy for S3 bucket access, and establishing an IAM role with an instance profile for EC2 service.
Common Task Requirements
•	Do not define the backend in the configuration; Terraform will use the local backend by default.
•	Avoid the usage of the local-exec provisioner.
•	The use of the prevent_destroy lifecycle attribute is prohibited.
•	Use versions.tf to define the required versions of Terraform and its providers.
•	Define the Terraform required_version as >= 1.5.7.
•	All variables must include valid descriptions and type definitions, and they should only be defined in variables.tf.
•	Resource names provided in tasks should be defined via variables or generated dynamically/concatenated (e.g., in locals using Terraform functions). Avoid hardcoding in resource definitions or using the default property for variables.
•	Configure all non-sensitive input parameter values in terraform.tfvars.
•	Outputs must include valid descriptions and should only be defined in outputs.tf.
•	Ensure TF configuration is clean and correctly formatted. Use the terraform fmt command to rewrite Terraform configuration files into canonical format and style.


Task Resources
•	AWS aws_security_group resource - manages virtual firewall rules to control inbound and outbound traffic for EC2 instances
•	AWS aws_security_group_rule resource - defines individual ingress and egress rules for security groups
•	AWS aws_network_interface_sg_attachment resource - attaches security groups to existing network interfaces
•	Tags – key-value metadata pairs used in AWS to organize resources, track costs, and support automation.
The following tags must be added to each security group configuration:
Project=cmtr-k5vl9gpq
•	Local files:
•	variables.tf - defines variables used across Terraform configurations
•	network_security.tf - contains all network security-related resources
•	Pre-created infrastructure:
•	VPC cmtr-k5vl9gpq-vpc (vpc-076433a6c497363a4) with CIDR 10.0.0.0/16
•	Public subnet cmtr-k5vl9gpq-public-subnet (subnet-04aa38ce5ec4bba2e)
•	Private subnet cmtr-k5vl9gpq-private-subnet (subnet-04052764f0d610c14)
•	Public EC2 instance cmtr-k5vl9gpq-public-instance (i-086333b46ed663ce6) running Nginx on port 80
•	Private EC2 instance cmtr-k5vl9gpq-private-instance (i-0072a49bde8eb160d) running Nginx on port 8080
•	AWS Region: us-east-1
•	Project ID: cmtr-k5vl9gpq

Objectives
1.	Create files variables.tf, network_security.tf, terraform.tfvars.
2.	In the variables.tf file, define the following variables with appropriate descriptions and types:
- allowed_ip_range - list of IP address range for secure access.
- All infrastructure ID variables provided by the platform (vpc_id, public_instance_id, etc.)
3.	Add the following resources to the network_security.tf file:
- SSH Security Group
o	Name: cmtr-k5vl9gpq-ssh-sg
o	Ingress Rules:
o	Allow SSH (port 22/tcp) from allowed_ip_range
o	Allow ICMP (all types) from allowed_ip_range
o	Public HTTP Security Group
o	Name: cmtr-k5vl9gpq-public-http-sg
o	Ingress Rules:
o	Allow HTTP (port 80/tcp) from allowed_ip_range
o	Allow ICMP (all types) from allowed_ip_range
o	Private HTTP Security Group
o	Name: cmtr-k5vl9gpq-private-http-sg
o	Ingress Rules (use source_security_group_id instead of CIDR blocks):
o	Allow HTTP (port 8080/tcp) from Public HTTP Security Group
o	Allow ICMP (all types) from Public HTTP Security Group
4.	Security Group Attachments:
- Attach SSH and Public HTTP security groups to Public instance cmtr-k5vl9gpq-public-instance (i-086333b46ed663ce6)
- Attach SSH and Private HTTP security groups to Private instance cmtr-k5vl9gpq-private-instance (i-0072a49bde8eb160d)
- Use aws_network_interface_sg_attachment resources
5.	Configure your IP address:
o	In your terraform.tfvars file, set allowed_ip_range = ["18.153.146.156/32", "YOUR_PUBLIC_IP/32"]
o	Example: allowed_ip_range = ["18.153.146.156/32", "203.0.113.25/32"]
6.	Validation and formatting:
o	Run terraform fmt to format your code
o	Run terraform validate to ensure configurations are correct
o	Run terraform plan to preview infrastructure changes

Task Verification
o	The verification process will test the following:
o	Security Group Creation: All 3 security groups exist with correct names
o	Security Group Rules: Each security group has the exact number of ingress rules:
- SSH Security Group: 2 rules (SSH + ICMP)
- Public HTTP Security Group: 2 rules (HTTP + ICMP)
- Private HTTP Security Group: Uses source_security_group_id references
o	Security Group Attachments: Correct security groups attached to each EC2 instance
o	Connectivity Test: Public Instance serves Nginx welcome page after 60-second initialization
o	Important Notes:
- Private instance should ONLY be accessible from Public instance (not directly from internet)
- Use source_security_group_id for Private HTTP Security Group rules (security best practice)
- Do not remove or modify the platform security group used for automated testing
o	

Note: git repository is 
https://github.com/DanielBS88/AWS-IaC-with-Terraform-Configure-Network-Security.git

