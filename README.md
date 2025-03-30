# PaloAlto Firewall ZTNA Connector Terraform Project

This repository contains Terraform configurations to deploy and configure Palo Alto Networks Zero Trust Network Access (ZTNA) connectors, enabling secure access to applications without exposing them to the public internet.

## Prerequisites

- Terraform v1.0.0+
- AWS CLI configured with appropriate credentials
- SSH key pair for EC2 instance access
- Palo Alto Networks ION API credentials

## Quick Start

1. Clone the repository:
   ```
   git clone https://github.com/shlomo-b/paloalto-fw-ztna-tf.git
   cd paloalto-fw-ztna-tf
   ```

2. SSH Key Setup:
   - Terraform will generate a private key file named `TFkey.pem` in your project directory
   - Set appropriate permissions on the generated key file:
     ```
     # Windows (PowerShell)
     icacls TFkey.pem /inheritance:r /grant:r "$($env:USERNAME):(R,W)"
     
     # Linux/macOS
     chmod 400 TFkey.pem
     ```

3. Configure your deployment:
   - Edit `prod.auto.tfvars` with your specific configuration:
     ```
     # Required ION API credentials
     ion_key = "your-ion-key"
     ion_secret = "your-ion-secret"
     ```

4. Initialize and apply the Terraform configuration:
   ```
   terraform init
   terraform apply
   ```

5. Connect to the deployed EC2 instance:
   ```
   # Navigate to your project directory where TFkey.pem is located
   cd path/to/paloalto-fw-ztna-tf
   
   # Connect using the generated key
   ssh -i "TFkey.pem" root@<ec2-instance-dns>
   ```

## SSH Connection Troubleshooting

If you encounter SSH connection issues:

1. Remove old server keys from known_hosts:
   ```
   # Windows (PowerShell)
   ssh-keygen -R ec2-instance-hostname
   
   # Alternative manual removal
   (Get-Content ~/.ssh/known_hosts) | Where-Object {$_ -notmatch "ec2-instance-hostname"} | Set-Content ~/.ssh/known_hosts
   ```

2. Ensure key file permissions are correct:
   ```
   # Windows (PowerShell)
   icacls C:\path\to\TFkey.pem
   
   # Linux/macOS
   ls -la /path/to/TFkey.pem
   ```

## Palo Alto Configuration

Once connected to the EC2 instance, you can configure the Palo Alto device:

```
# Enter configuration mode
configure

# Example: Change admin password
set mgt-config users admin password <new_password>

# Commit changes
commit

# Exit configuration mode
exit
```

## ZTNA Connector Configuration

The ZTNA connector is deployed using AWS CloudFormation. You have two options for the template source:

### Option 1: Use the AWS Marketplace Template
If you want to use the default AWS Marketplace template, uncomment and use:
```hcl
variable "template_url" {
  default = "https://s3.amazonaws.com/awsmp-fulfillment-cf-templates-prod/c531b556-fc22-4f3e-aea6-4553f50ff77b/411852c8e5f941cf8f072e94eb48e49d.template"
  type    = string
}
```

### Option 2: Use a Custom Template
If you need to customize the template, upload your modified template to your own S3 bucket and reference it:
```hcl
variable "template_url" {
  default = "https://s3.amazonaws.com/your-bucket-name/templates/cf-stack.template"
  type    = string
}
```

The CloudFormation stack is created for each ZTNA connector defined in your variables:
```hcl
resource "aws_cloudformation_stack" "ztna_connector" {
  for_each = var.ztnas
  
  name          = each.key
  template_url  = var.template_url
  
  parameters = {
    InstanceName  = each.value.InstanceName
    IONKey        = each.value.IONKey
    IONSecret     = each.value.IONSecret
    MyVPC         = module.vpc[each.value.vpc_key].vpc_id
    PublicSubnet  = data.aws_subnet.public[each.key].id
  }
  
  capabilities = ["CAPABILITY_IAM"]
}
```

## Security Considerations

- Keep your ION API credentials secure
- Regularly rotate SSH keys and passwords
- Implement least privilege access controls
- Monitor ZTNA connector logs for suspicious activity

## Project Structure

```
paloalto-fw-ztna-tf/
├── .terraform/                 # Terraform initialization directory
├── secrets/                    # Directory for secret keys and credentials
├── stack-remplate/             # Template configurations
├── .gitignore                  # Git ignore file
├── .terraform.lock.hcl         # Terraform dependency lock file
├── ec2.tf                      # EC2 instance configuration
├── key.tf                      # SSH key pair configuration
├── main.tf                     # Main infrastructure configuration
├── outputs.tf                  # Output definitions
├── paloalto.tf                 # Palo Alto specific configuration
├── prod.auto.tfvars            # Environment-specific variables
├── README.md                   # This documentation file
├── sg.tf                       # Security group definitions
├── terraform.tfstate           # Terraform state file
├── terraform.tfstate.backup    # Backup of Terraform state
├── variables.tf                # Variable definitions
├── ztna-connector.tf           # ZTNA connector configuration
└── ztnas-connectors.tf         # Additional ZTNA connectors configuration
```