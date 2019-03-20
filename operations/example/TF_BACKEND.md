# TERRFORM S3 BACKEND:

To initialize Terraform manually run:
```
terraform init \
    -backend-config="region=AWS_REGION" \
    -backend-config="bucket=BUCKET_NAME" \
    -backend-config="key="KEY_NAME"
```

To make a plan:
```
terraform plan \
    -var-file="PATH/terraform.tfvars" \
    -out=tfplan \
    -input=false
```

To apply:
```
terraform apply "tfplan"
```
