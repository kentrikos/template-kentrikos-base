# TERRFORM S3 BACKEND:

To initialize Terraform run:
```
terraform init \
    -backend-config="PATH_TO_backend.tf" \
    -backend-config="region=AWS_REGION" \
    -backend-config="bucket=BUCKET_NAME" \
    -backend-config="key=KEY_NAME" \
    -backend-config="role_arn=ARN"
```
