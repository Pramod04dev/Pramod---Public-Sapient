TERRAFORM SCRIPT TO SPIN UP EKS CLUSTER

EKS with AWS MANAGED WORKER NODE

Below are the terraform commands to execute.

terraform init -backend-config="bucket=S3 bucket to store state files" \
            -backend-config="key=path and file name for the statefile" \
            -backend-config="region=AWS region of the S3 bucket" \
            -backend=true \
            -force-copy \
            -get=true \
            -input=false \
            -no-color'

terraform plan -var-file=dev.tfvars ${tf_override_vars} \
            -out .terraform/latest-plan -no-color'
            
Validate terraform plan with all resources that are going to add.

terraform apply --input=false .terraform/latest-plan -no-color
