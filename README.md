# CloudAutomation

This repository provides a modular, production-ready structure for automating AWS infrastructure provisioning using Terraform and Python. Each AWS resource (such as EC2, Security Group, VPN, Subnet, S3, Auto Scaling, DynamoDB, ECR, Lambda, Step Functions) is managed as a separate Terraform module. Python code is supplied for Lambda and Step Functions where appropriate.

## Structure

```
/terraform-modules/
  ec2/
  security-group/
  vpn/
  subnet/
  s3/
  autoscaling/
  dynamodb/
  ecr/
  lambda/
  step-functions/
/lambda-code/
/step-functions-code/
```

- Each module contains its own `main.tf`, `variables.tf`, and `outputs.tf`.
- Python code for Lambda functions is in `/lambda-code/`.
- Step Functions definitions are in `/step-functions-code/`.

## Getting Started

1. **Clone the repository**  
   `git clone https://github.com/pillatipriyanka/CloudAutomation.git`

2. **Navigate to a module**  
   Each resource is a self-contained Terraform module. For example:
   ```
   cd terraform-modules/ec2
   ```

3. **Edit variables**  
   Edit `variables.tf` or use a `terraform.tfvars` file for your environment.

4. **Initialize and apply**  
   ```
   terraform init
   terraform apply
   ```

5. **Composing infrastructure**  
   Create a root `main.tf` that uses the modules and wires them together by passing outputs as inputs.

## Sample Usage

Example root `main.tf`:
```hcl
module "vpc" {
  source = "./terraform-modules/vpc"
  # ...
}

module "subnet" {
  source = "./terraform-modules/subnet"
  vpc_id = module.vpc.vpc_id
  # ...
}
# and so on for each resource
```

## Customization

- Modify the modules as needed for your environment.
- Add more modules or Python code as your infrastructure grows.

## Contributing

Feel free to submit pull requests or open issues for improvements!

---

© 2025 pillatipriyanka